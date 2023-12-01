package com.example.chitraghar_project.dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private final static String url = "jdbc:mysql://localhost:3307/chitraghar";
    private static String user = "root";
    private static String pass = "TS@0722";
    public static Connection getConnection() throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection = DriverManager.getConnection(url,user,pass);

        if (connection == null){
            System.out.println("Connection Failed");
        }

        return connection;
    }
    public static void closeConnection(Connection connection) throws SQLException{
        if (connection != null && !connection.isClosed()){
            connection.close();
        }
    }
}
