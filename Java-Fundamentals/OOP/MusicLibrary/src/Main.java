import controller.JsonHandler;
import model.MusicLibrary;
import tools.Menu;
import controller.MusicLibraryManager;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        MusicLibrary library = JsonHandler.loadLibrary();

        int choice;

        do {
            ArrayList<String> mainEntries = new ArrayList<>();
            mainEntries.add("1 - Add Album");
            mainEntries.add("2 - Delete Album");
            mainEntries.add("3 - Add Track");
            mainEntries.add("4 - Delete Track");
            mainEntries.add("5 - Show Album");
            mainEntries.add("6 - Show All Albums");
            mainEntries.add("7 - Exit");

            Menu mainMenu = new Menu(mainEntries);
            choice = mainMenu.getChoice();

            switch (choice) {
                case 1 -> MusicLibraryManager.addAlbum(scanner, library);
                case 2 -> MusicLibraryManager.deleteAlbum(scanner, library);
                case 3 -> MusicLibraryManager.addTrack(scanner, library);
                case 4 -> MusicLibraryManager.deleteTrack(scanner, library);
                case 5 -> MusicLibraryManager.showAlbum(scanner, library);
                case 6 -> MusicLibraryManager.showAllAlbums(library);
                case 7 -> System.out.println("Goodbye!");
                default -> System.out.println("Invalid choice!");
            }

        } while (choice != 7);

        JsonHandler.saveLibrary(library);
    }
}
