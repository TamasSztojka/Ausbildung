package controller;

import model.Album;
import model.MusicLibrary;
import model.Track;
import tools.Validation;

import java.util.Scanner;

public class MusicLibraryManager {

    public static void addAlbum(Scanner scanner, MusicLibrary library) {
        System.out.println("\n=== Add Album ===");

        String title = Validation.readNonEmptyString(scanner, "Album title: ");
        String artist = Validation.readNonEmptyString(scanner, "Artist: ");

        Album album = new Album(title, artist);
        library.addAlbum(album);

        System.out.println("Album created with ID: " + album.getAlbumID() + "\n");
    }

    public static void deleteAlbum(Scanner scanner, MusicLibrary library){
        System.out.println("\n=== Delete Album ===");

        int id = Validation.readPositiveInt(scanner, "Album ID: ");

        Album album = library.getAlbum(id);

        if(album != null){
            System.out.println("Album not found \n");
            return;
        }

        library.removeAlbum(id);
        System.out.println("Album removed. \n");
    }

    public static void addTrack(Scanner scanner, MusicLibrary library) {
        System.out.println("\n=== Add Track ===");

        int albumID = Validation.readPositiveInt(scanner, "Album ID: ");
        Album album = library.getAlbum(albumID);

        if (album == null) {
            System.out.println("Album not found \n");
            return;
        }

        String title = Validation.readNonEmptyString(scanner, "Track title: ");
        String fileName = Validation.readNonEmptyString(scanner, "MP3 filename: ");
        int lengthSec = Validation.readPositiveInt(scanner, "Length (seconds): ");

        Track track = new Track(title, fileName, lengthSec);

        album.addTrack(track);

        System.out.println("Track added with ID: " + track.getTrackID() + "\n");
    }

    public static void deleteTrack(Scanner scanner, MusicLibrary library){
        System.out.println("\n== Delete Track ===");

        int albumID = Validation.readPositiveInt(scanner, "Album ID: ");
        Album album = library.getAlbum(albumID);

        if (album == null) {
            System.out.println("Album not found \n");
            return;
        }

        int trackID = Validation.readPositiveInt(scanner, "Track ID: ");
        album.removeTrack(trackID);

        System.out.println("Track removed (if it existed).\n");
    }

    public static void showAlbum(Scanner scanner, MusicLibrary library) {
        System.out.println("\n=== Show Album ===");

        int id = Validation.readPositiveInt(scanner, "Album ID: ");
        Album album = library.getAlbum(id);

        if (album == null) {
            System.out.println("Album not found \n");
            return;
        }

        System.out.println("\nAlbum: " + album.getTitle());
        System.out.println("Artist: " + album.getArtist());
        System.out.println("Total Duration: " + album.getTotalDuration()+ " sec\n");

        System.out.println("Tracks:");
        for (Track track : album.getTracks()) {
            System.out.println(" - [" + track.getTrackID() + "] "
                    + track.getTitle() + " (" + track.getLengthSec() + " sec)");
        }

        System.out.println();
    }

    public static void showAllAlbums(MusicLibrary library) {
        System.out.println("\n=== All Albums ===");

        if (library.getAlbums().isEmpty()) {
            System.out.println("No albums available. \n");
            return;
        }

        for (Album album : library.getAlbums()) {
            System.out.println(" - [" + album.getAlbumID() + "] " + album.getTitle());
        }
        System.out.println();
    }
}
