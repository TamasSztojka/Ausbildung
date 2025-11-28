package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import model.MusicLibrary;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class JsonHandler {

    private static final String FILE_NAME = "musiclibrary.json";
    private static final Gson gson = new GsonBuilder().setPrettyPrinting().create();

    public static void saveLibrary(MusicLibrary library) {
        try (FileWriter writer = new FileWriter(FILE_NAME)) {
            gson.toJson(library, writer);
            System.out.println("Library saved.");
        } catch (IOException e) {
            System.out.println("Error saving library: " + e.getMessage());
        }
    }

    public static MusicLibrary loadLibrary() {
        try (FileReader reader = new FileReader(FILE_NAME)) {
            MusicLibrary library = gson.fromJson(reader, MusicLibrary.class);
            System.out.println("Library loaded.");
            return library != null ? library : new MusicLibrary();
        } catch (IOException e) {
            System.out.println("No library file found. Starting with an empty library.");
            return new MusicLibrary();
        }
    }
}
