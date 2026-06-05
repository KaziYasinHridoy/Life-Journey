package com.yasin.learning;
import java.sql.*;
public class LaunchApp1 {
    static void main() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url      = System.getenv("DB_URL");
        String user     = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");
        Connection connection= DriverManager.getConnection(url,user,pass);

        Statement statement = connection.createStatement();

        String sql= "INSERT INTO student (id, name, age, city)\n" +
                "VALUES \n" +
                "(1, 'Arafat', 20, 'Dhaka'),\n" +
                "(2, 'Nadia', 21, 'Chattogram'),\n" +
                "(3, 'Rahim', 22, 'Khulna');";
        int affectedRow=statement.executeUpdate(sql);
        if (affectedRow==0) System.out.println("Unable to insert data");
        else System.out.println("Data inserted successfully");
        statement.close();
        connection.close();
    }
}
