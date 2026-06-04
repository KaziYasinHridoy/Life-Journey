package com.yasin.learning;

import java.sql.Connection;
import java.sql.*;

public class LaunchApp2_Upgraded {
    public static void main(String [] args) {
        String url  = "jdbc:mysql://localhost:3306/JDBC_learning";
        String user = "root";
        String pass = "secure";
        try(Connection connect= DriverManager.getConnection(url,user,pass);
            Statement statement=connect.createStatement()){
            String insertSQL = "INSERT INTO student2 (name, age, grade) VALUES " +
                    "('Alice', 20, 'A'), " +
                    "('Bob', 22, 'B'), " +
                    "('Charlie', 21, 'A+')";
            statement.execute(insertSQL);

            // Select data
            String  sql    = "SELECT * FROM student2";
            boolean status = statement.execute(sql);
            ResultSet rs = statement.getResultSet();
            if (status) { //or-->if (rs != null)
                while (rs.next()) {
                    System.out.println(
                            rs.getInt("id")      + " " +
                                    rs.getString("name") + " " +
                                    rs.getInt("age")     + " " +
                                    rs.getString("grade")
                    );
                }
            } else {
                int rowsAffected = statement.getUpdateCount();
                System.out.println("Rows affected: " + rowsAffected);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
