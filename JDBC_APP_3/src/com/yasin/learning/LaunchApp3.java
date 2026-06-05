package com.yasin.learning;

import java.sql.*;
import java.util.Scanner;

public class LaunchApp3 {

    public static void main(String[] args) {

        Connection connection = null;
        PreparedStatement ps = null;

        try {

            String sql =
                    "INSERT INTO student VALUES (?,?,?,?)";

            connection = JdbcUtility.getConnection();

            ps = connection.prepareStatement(sql);

            Scanner scanner= new Scanner(System.in);
            System.out.println("Total Inputs:");
            int n= scanner.nextInt();
            for (int i = 0; i < n; i++) {
                System.out.println("-------Student "+i+1+"-------");
                System.out.println("ID:");
                ps.setInt(1,scanner.nextInt() );
                System.out.println("Name:");
                ps.setString(2, scanner.next());
                System.out.println("Age:");
                ps.setInt(3, scanner.nextInt());
                System.out.println("City:");
                ps.setString(4, scanner.next());
                ps.executeUpdate();
            }
            sql = "SELECT * FROM student";

            ps = connection.prepareStatement(sql);
            boolean status= ps.execute();
            ResultSet rs = ps.getResultSet();
            System.out.println("Added Information:");
            if (status) {
                while (rs.next()) {
                    System.out.println(
                            rs.getInt("id") + " " +
                                    rs.getString("name") + " " +
                                    rs.getInt("age") + " " +
                                    rs.getString("city")
                    );
                }

            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JdbcUtility.closeAllConnection(
                    ps,
                    connection
            );
        }
    }
}