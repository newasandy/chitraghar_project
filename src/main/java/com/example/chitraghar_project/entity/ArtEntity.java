package com.example.chitraghar_project.entity;

public class ArtEntity {
private static String title;
private static String description;
private static String artType;
private static String artist;
private static int userId;
private static byte[] imageBytes;

    public static String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public static byte[] getImageBytes() {
        return imageBytes;
    }

    public void setImageBytes(byte[] imageBytes) {
        this.imageBytes = imageBytes;
    }

    public static String getDescription() {
        return description;
    }

    public static int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        ArtEntity.userId = userId;
    }

    public void setDescription(String description) {
        ArtEntity.description = description;
    }

    public static String getArtType() {
        return artType;
    }

    public void setArtType(String artType) {
        this.artType = artType;
    }

    public static String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }
}
