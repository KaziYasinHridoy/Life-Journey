package com.yasin.learning;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
//Case 1: Keep <mapping class="com.yasin.learning.Student"/>, remove @Entity from the class
//Hibernate reads the XML, sees "go look at the Student class." It opens the class... and finds
// nothing telling it how to map it. No @Entity, no @Table, no @Id, no @Column. So Hibernate has
// no idea this is supposed to be a database table, what the table is called, or which field is
// the primary key.
//Result: it crashes at startup, usually with an error like "Unable to find
// mapped class" or "not mapped" type exceptions, because pointing at a plain Java class
// with no mapping info gives Hibernate nothing to work with.
//
//Case 2: Keep @Entity on the Student class, remove <mapping class="com.yasin.learning.Student"/>
// from the XML
//Now the class itself is fully annotated correctly — @Entity, @Id, etc. all present.
// But Hibernate, when it starts up using plain Configuration().configure(), only loads
// what's listed in hibernate.cfg.xml. It never goes looking at Student.java on its own.
// It simply doesn't know that class exists.
//Result: no crash, but Student is invisible to Hibernate. No table gets created/updated
// for it, and if you try to save/query a Student object, you'll get an error
// like "Unknown entity" — because as far as Hibernate's session factory is concerned, that
// class was never registered.
@Table(name = "students")
public class Student {
    @Id//primary key
    @Column(name = "ID")
    private int sid;
    @Column(name = "NAME")
    private String sname;
    @Column(name = "AGE")
    private int sage;
    @Column(name = "CITY")
    private String scity;

    public Student() {
    }

    public int getId() {
        return sid;
    }

    public void setId(int id) {
        this.sid = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public int getSage() {
        return sage;
    }

    public void setSage(int sage) {
        this.sage = sage;
    }

    public String getScity() {
        return scity;
    }

    public void setScity(String scity) {
        this.scity = scity;
    }
}