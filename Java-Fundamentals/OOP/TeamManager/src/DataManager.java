import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;

public class DataManager {
    private static final String FILE_PATH = "clubdata.json";
    private static final Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
            .setPrettyPrinting()
            .create();

    public static void saveClub(Club club) {
        try (FileWriter writer = new FileWriter(FILE_PATH)){
            gson.toJson(club, writer);
            System.out.println("Data saved successfully");
        }
        catch (IOException e) {
            System.out.println("Error saving club " + e.getMessage());
        }
    }

    public static Club loadClub(){
        try (FileReader reader = new FileReader(FILE_PATH)) {
            Club loadedClub = gson.fromJson(reader, Club.class);
            System.out.println("Data loaded successfully");

            return loadedClub;
        }
        catch (IOException e) {
            System.out.println("No saved file found, creating new club.");
            return null;
        }
    }
}
