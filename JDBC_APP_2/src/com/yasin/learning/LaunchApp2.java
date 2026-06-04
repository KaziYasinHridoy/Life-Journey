package com.yasin.learning;

import java.sql.*;

public class LaunchApp2 {

    public static void main(String[] args) {
        String url  = "jdbc:mysql://localhost:3306/JDBC_learning";
        String user = "root";
        String pass = "secure";

        Connection connection = null;
        Statement  statement  = null;
        ResultSet  rs         = null;

        try {
            connection = DriverManager.getConnection(url, user, pass);
            statement  = connection.createStatement();

            // Drop table if exists
            statement.execute("DROP TABLE IF EXISTS student2");

            // Create table
            String createSQL = "CREATE TABLE IF NOT EXISTS student2 (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "name VARCHAR(50), " +
                    "age INT, " +
                    "grade VARCHAR(10))";
            statement.execute(createSQL);

            // Insert data
            String insertSQL = "INSERT INTO student2 (name, age, grade) VALUES " +
                    "('Alice', 20, 'A'), " +
                    "('Bob', 22, 'B'), " +
                    "('Charlie', 21, 'A+')";
            statement.execute(insertSQL);

            // Select data
            String  sql    = "SELECT * FROM student2";
            boolean status = statement.execute(sql);
            rs = statement.getResultSet();
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

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs         != null) rs.close();
                if (statement  != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}