package com.example.chitraghar_project.services;

import java.text.DecimalFormat;
import java.util.Map;

public class CosineSimilarityAlgo {
    public static double cosineSimilarity(Map<String, Integer> vector1, Map<String, Integer> vector2) {
        double dotProduct = 0;
        double norm1 = 0;
        double norm2 = 0;

        for (String key : vector1.keySet()) {
            if (vector2.containsKey(key)) {
                dotProduct += vector1.get(key) * vector2.get(key);
            }
            norm1 += Math.pow(vector1.get(key), 2);
        }

        for (Integer value : vector2.values()) {
            norm2 += Math.pow(value, 2);
        }
        double similarity = dotProduct / (Math.sqrt(norm1) * Math.sqrt(norm2));
        int decimalPlaces = 2;
        DecimalFormat df = new DecimalFormat("#." + "0".repeat(decimalPlaces));
        double roundedValue = Double.parseDouble(df.format(similarity));
        return roundedValue;
    }

    public static double cosineSimilarityForReco(Map<Integer, Integer> vector1, Map<Integer, Integer> vector2) {
        double dotProduct = 0;
        double norm1 = 0;
        double norm2 = 0;

        for (Integer key : vector1.keySet()) {
            if (vector2.containsKey(key)) {
                dotProduct += vector1.get(key) * vector2.get(key);
            }
            norm1 += Math.pow(vector1.get(key), 2);
        }

        for (Integer value : vector2.values()) {
            norm2 += Math.pow(value, 2);
        }
        double similarity = dotProduct / (Math.sqrt(norm1) * Math.sqrt(norm2));
        int decimalPlaces = 2;
        DecimalFormat df = new DecimalFormat("#." + "0".repeat(decimalPlaces));
        double roundedValue = Double.parseDouble(df.format(similarity));
        return roundedValue;
    }
}
