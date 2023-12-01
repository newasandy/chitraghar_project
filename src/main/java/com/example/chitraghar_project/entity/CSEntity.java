package com.example.chitraghar_project.entity;

import java.util.ArrayList;

public class CSEntity {
    private static ArrayList<Integer> myArtId = new ArrayList<>();


    public CSEntity(ArrayList<Integer> myArtId) {
        this.myArtId = myArtId;
    }

    public static ArrayList<Integer> getMyArtId() {
        return myArtId;
    }
}
