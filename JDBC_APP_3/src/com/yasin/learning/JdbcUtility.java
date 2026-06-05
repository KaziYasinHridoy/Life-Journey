package com.yasin.learning;

import java.sql.*;

public class JdbcUtility {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        String url      = "jdbc:mysql://localhost:3306/JDBC_learning";
        String user     = "root";
        String password = "secure";
        return DriverManager.getConnection(url, user, password);
    }

    public static void closeAllConnection(ResultSet rs, PreparedStatement statement, Connection connection) {
        try {
            if (rs         != null) rs.close();
            if (statement  != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // If you don't have ResultSet (INSERT/UPDATE/DELETE)
    public static void closeAllConnection(PreparedStatement statement, Connection connection) {
        closeAllConnection(null, statement, connection);
    }

    // If you only need to close connection
    public static void closeAllConnection(Connection connection) {
        closeAllConnection(null, null, connection);
    }
}