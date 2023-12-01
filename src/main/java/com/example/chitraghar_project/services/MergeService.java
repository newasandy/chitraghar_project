package com.example.chitraghar_project.services;

import com.example.chitraghar_project.entity.MergeEntity;

import java.util.ArrayList;

public class MergeService {
    public static void mergeSort(ArrayList<MergeEntity> arr) {
        if (arr.size() <= 1){
            return;
        }

        int mid = arr.size()/ 2;
        ArrayList<MergeEntity> left = new ArrayList<>(arr.subList(0,mid));
        ArrayList<MergeEntity> right = new ArrayList<>(arr.subList(mid, arr.size()));
        mergeSort(left);
        mergeSort(right);
        merge(arr, left, right);

    }

    public static void merge(ArrayList<MergeEntity> arr, ArrayList<MergeEntity> left, ArrayList<MergeEntity> right) {
        int leftIndex = 0;
        int rightIndex = 0;
        int listIndex = 0;
        while (leftIndex < left.size() && rightIndex < right.size()){
            if (left.get(leftIndex).getValue() < right.get(rightIndex).getValue()){
                arr.set(listIndex++,right.get(rightIndex++));
            }else {
                arr.set(listIndex++,left.get(leftIndex++) );
            }
        }
        while (leftIndex < left.size()){
            arr.set(listIndex++, left.get(leftIndex++));
        }
        while (rightIndex < right.size()){
            arr.set(listIndex++ , right.get(rightIndex++));
        }
    }
}
