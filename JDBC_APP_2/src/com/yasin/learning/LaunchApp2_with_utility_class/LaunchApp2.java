package com.yasin.learning.LaunchApp2_with_utility_class;
import java.sql.*;
public class LaunchApp2 {

    public static void main(String[] args) {

        Connection connection = null;
        Statement  createStatement  = null;
        ResultSet  rs         = null;

        try {
            connection = JdbcUtility.getConnection(); // change 1

            createStatement  = connection.createStatement();

            createStatement.execute("DROP TABLE IF EXISTS student2");

            String createSQL = "CREATE TABLE IF NOT EXISTS student2 (" +
                    "id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "name VARCHAR(50), " +
                    "age INT, " +
                    "grade VARCHAR(10))";
            createStatement.execute(createSQL);

            String insertSQL = "INSERT INTO student2 (name, age, grade) VALUES " +
                    "('Alice', 20, 'A'), " +
                    "('Bob', 22, 'B'), " +
                    "('Charlie', 21, 'A+')";
            createStatement.execute(insertSQL);

            String  sql    = "SELECT * FROM student2";
            boolean status = createStatement.execute(sql);
            rs = createStatement.getResultSet();
            if (status) {
                while (rs.next()) {
                    System.out.println(
                            rs.getInt("id")      + " " +
                                    rs.getString("name") + " " +
                                    rs.getInt("age")     + " " +
                                    rs.getString("grade")
                    );
                }
            } else {
                int rowsAffected = createStatement.getUpdateCount();
                System.out.println("Rows affected: " + rowsAffected);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtility.closeAllConnection(rs, createStatement, connection); // change 2
        }
    }
}