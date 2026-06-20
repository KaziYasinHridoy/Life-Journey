package com.yasin.learning;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class App {
    public static void main( String[] args ) {
        Student s = new Student();
        s.setId(914);
        s.setSname("Yasin");
        s.setSage(22);
        s.setScity("Dubai");

        // Step 1: Create the Configuration object
        // WHY: Hibernate needs a place to collect all setup info (DB details,
        // entity mappings) before it can do anything. This object is just an
        // empty container — nothing works until it's loaded in Step 2.
        Configuration configuration = new Configuration();

        // Step 2: Load the configuration file into the Configuration object
        // WHY: Hibernate doesn't know which database to connect to, what
        // username/password to use, or which Java classes map to which tables
        // until it reads hibernate.cfg.xml. This step fills the empty
        // Configuration object with all of that info.
        // (Filename is optional if it's named exactly "hibernate.cfg.xml" —
        // configure() finds it automatically in that case.)
        configuration.configure("hibernate.cfg.xml");

        // Step 3: Build the SessionFactory
        // WHY: This is where Hibernate actually sets up the JDBC connection pool
        // using the info from Step 2. It's expensive to create, so it's built
        // ONCE per app and reused — it then acts as a factory that hands out
        // Session objects whenever you need to talk to the DB.
        SessionFactory sessionFactory = configuration.buildSessionFactory();

        // Step 4: Open a Session
        // WHY: You can't run DB operations directly on the SessionFactory — you
        // need a Session, which represents one unit of work with the database.
        // It's lightweight, so you open a new one per task rather than reusing
        // a single one across unrelated operations.
        Session session = sessionFactory.openSession();

        // Step 5: Begin a Transaction
        // WHY: INSERT/UPDATE/DELETE change data, so they need to be wrapped in
        // a transaction — this lets you undo everything (rollback) if something
        // goes wrong, instead of leaving the DB in a half-changed state.
        // SELECT doesn't change anything, so it doesn't need this safety net.
        Transaction tx = session.beginTransaction();

        // Step 6: Perform the operation
        // WHY: This is the actual ORM benefit — you hand Hibernate a Java
        // object and it generates the SQL for you. You never write raw SQL
        // or manually set each column value like you would with JDBC.
         session.persist(s);   //→ INSERT  or, Serializable id = session.save(s) which returns the generated ID
        // session.merge(s);    → UPDATE
        // session.remove(s);   → DELETE
        // session.get(Class, id) → SELECT (no transaction needed)
        // (left as comment — no entity object created yet)

        // Step 7: Commit or rollback
        // WHY: Changes made via persist/merge/remove aren't written to the DB
        // permanently until you commit — this gives you a checkpoint to either
        // confirm the change (commit) or cancel it entirely (rollback) before
        // it becomes permanent.
         tx.commit();
        //or
        // tx.rollback();
        // (left as comment — depends on Step 6 actually running first)

        // Step 8: Close resources
        // WHY: Session and SessionFactory hold onto real DB resources
        // (connections). Not closing them leaks resources and can eventually
        // exhaust the connection pool. Close Session after each unit of work;
        // close SessionFactory only when the whole app is shutting down.
         session.close();
         sessionFactory.close();
        // (left as comment — placed last so it doesn't close resources too early)
    }
}