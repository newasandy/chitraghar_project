package com.example.chitraghar_project.services;

import com.example.chitraghar_project.dbConnection.DatabaseConnection;

import java.sql.*;

public class NewArtRating {
    private static Connection connection;
    private static Statement statement;
    private static PreparedStatement preparedStatement;
    private static ResultSet resultSet;


    public static void insertRating(int id) throws SQLException , ClassNotFoundException{
        double avgRate = 0.0;
        connection = DatabaseConnection.getConnection();
        String checkQuery = "select * from avg_rating where art_id = "+id;
        statement = connection.createStatement();
        resultSet = statement.executeQuery(checkQuery);
        int artId = 0;
        while (resultSet.next()){
            artId = resultSet.getInt("art_id");

        }
        if (artId != id){
            String insert = "insert into avg_rating(art_id,avg_rate) values (?,?)";
            preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setInt(1,id);
            preparedStatement.setDouble(2,avgRate);
            int insertRow = preparedStatement.executeUpdate();

        }


    }
    public static void calculateRating(int artId) throws SQLException , ClassNotFoundException{
        Connection connection = DatabaseConnection.getConnection();
        String query = "select * from rating_collection where art_id="+artId;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        double totalRate = 0;
        int count=0;
        while (resultSet.next()){
            totalRate = totalRate + resultSet.getDouble(3);
            count++;
        }
        double AvgRate = totalRate/count;
        updateRating(artId,AvgRate);
    }

    public static void updateRating(int art_id ,double avg_rate) throws SQLException , ClassNotFoundException
    {
        connection = DatabaseConnection.getConnection();
        String updateRate = "update avg_rating set avg_rate =? where art_id =? ";
        preparedStatement = connection.prepareStatement(updateRate);
        preparedStatement.setDouble(1,avg_rate);
        preparedStatement.setInt(2,art_id);
        int updateRow = preparedStatement.executeUpdate();

    }
}
