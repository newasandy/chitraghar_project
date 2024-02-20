package com.example.chitraghar_project.services;

import com.example.chitraghar_project.dbConnection.DatabaseConnection;
import com.example.chitraghar_project.entity.ArtEntity;
import com.example.chitraghar_project.entity.UserEntity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class AllServices {
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private Statement statement;

    public void regUser() throws SQLException, ClassNotFoundException {
        connection = DatabaseConnection.getConnection();
        String insertQuery = "insert into users(Name,Email,Password) values (?,?,?)";
        String name = UserEntity.getName();
        String email = UserEntity.getEmail();
        String pass = UserEntity.getPassword();
        preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, pass);
        int insertData = preparedStatement.executeUpdate();
    }

    public void uploadArt() throws SQLException, ClassNotFoundException {
        connection = DatabaseConnection.getConnection();
        String upload = "insert into request_art(title,description,art,art_style,status,artist_id) values(?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(upload);
        preparedStatement.setString(1, ArtEntity.getTitle());
        preparedStatement.setString(2, ArtEntity.getDescription());
        preparedStatement.setBytes(3, ArtEntity.getImageBytes());
        preparedStatement.setString(4, ArtEntity.getArtType());
        preparedStatement.setString(5, "Pending");
        preparedStatement.setInt(6, ArtEntity.getUserId());
        int uploadData = preparedStatement.executeUpdate();
    }
    public static byte[] getArt(int artId) throws SQLException, ClassNotFoundException{
        byte[] art = new byte[0];
        Connection connection = DatabaseConnection.getConnection();
        String getArtist = "select * from request_art where id =" + artId;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(getArtist);
        while (resultSet.next()) {
            art = resultSet.getBytes("art");
        }
        return art;
    }

    public static void setArtRateCollection(int artId, double ratevalue, int userId) throws SQLException, ClassNotFoundException {
        Connection connection1 = DatabaseConnection.getConnection();
        String checkQuery = "select * from rating_collection where art_id=" + artId + " and user_id=" + userId;
        Statement statement1 = connection1.createStatement();
        ResultSet resultSet11 = statement1.executeQuery(checkQuery);
        int getArtId = 0;
        int getUserId = 0;
        while (resultSet11.next()) {
            getArtId = resultSet11.getInt(2);
            getUserId = resultSet11.getInt(4);
        }
        if (artId == getArtId && userId == getUserId) {

            String rateUpdate = "update rating_collection set rate_value = " + ratevalue + "where art_id=" + artId + " and user_id=" + userId;
            PreparedStatement preparedStatement = connection1.prepareStatement(rateUpdate);
            int updateRate = preparedStatement.executeUpdate();

        } else {
            String insertRate = "insert into rating_collection(art_id,rate_value,user_id) values(?,?,?)";
            PreparedStatement preparedStatement = connection1.prepareStatement(insertRate);
            preparedStatement.setInt(1, artId);
            preparedStatement.setDouble(2, ratevalue);
            preparedStatement.setInt(3, userId);
            int isertRate = preparedStatement.executeUpdate();
        }
        NewArtRating.calculateRating(artId);
    }


    
    public static String getArtistById(int id) throws SQLException, ClassNotFoundException {
        String ArtistName = null;
        Connection connection = DatabaseConnection.getConnection();
        String getArtist = "select * from users where Id =" + id;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(getArtist);
        while (resultSet.next()) {
            ArtistName = resultSet.getString("Name");
        }
        return ArtistName;
    }

    public static String getArtType(int id) throws SQLException, ClassNotFoundException {
        String ArtType = null;
        Connection connection = DatabaseConnection.getConnection();
        String getArtist = "select * from request_art where id =" + id;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(getArtist);
        while (resultSet.next()) {
            ArtType = resultSet.getString("art_style");
        }
        return ArtType;
    }


    public static double getRateValue(int artId) throws SQLException , ClassNotFoundException{
        Connection connection = DatabaseConnection.getConnection();
        String getRate = "select * from avg_rating where art_id="+artId;
        Statement statement =connection.createStatement();
        ResultSet resultSet = statement.executeQuery(getRate);
        double rateValue =0.0;
        while (resultSet.next()){
            rateValue = resultSet.getDouble("avg_rate");
        }
        return rateValue;
    }

    public static String getArtTitle(int artId) throws SQLException, ClassNotFoundException{
        String title = null;
        Connection connection = DatabaseConnection.getConnection();
        String getArtist = "select * from request_art where id =" + artId;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(getArtist);
        while (resultSet.next()) {
            title = resultSet.getString("title");
        }
        return title;
    }
    public static int getArtistId(int artId) throws SQLException, ClassNotFoundException{
        int artistId = 0;
        Connection connection = DatabaseConnection.getConnection();
        String getArtist = "select * from request_art where id =" + artId;
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(getArtist);
        while (resultSet.next()) {
            artistId = resultSet.getInt("artist_id");
        }
        return artistId;
    }

    public static List<Integer> pickRandomId(List<Integer> sourceList, int count) {
        List<Integer> pickedNumbers = new ArrayList<>();
        Random random = new Random();

        // Ensure count is not greater than the size of the source list
        count = Math.min(count, sourceList.size());

        for (int i = 0; i < count; i++) {
            int randomIndex = random.nextInt(sourceList.size());
            pickedNumbers.add(sourceList.get(randomIndex));
            sourceList.remove(randomIndex); // Ensure the same number is not picked again
        }

        return pickedNumbers;
    }
}
