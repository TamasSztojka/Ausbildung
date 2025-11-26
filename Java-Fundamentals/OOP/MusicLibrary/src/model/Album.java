package model;

import java.util.ArrayList;
import java.util.List;

public class Album {

    private int albumID;
    private String title;
    private String artist;

    private List<Track> tracks = new ArrayList<>();

    public Album(int albumID, String title, String artist) {
        this.albumID = albumID;
        this.title = title;
        this.artist = artist;
    }

    public int getAlbumID() {
        return albumID;
    }

    public void setAlbumID(int albumID) {
        this.albumID = albumID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public List<Track> getTracks() {
        return tracks;
    }

    public void setTracks(List<Track> tracks) {
        this.tracks = tracks;
    }

    public void addTrack(Track track) {
        tracks.add(track);
    }

    public void removeTrack(int trackID) {
        tracks.removeIf(track -> track.getTrackID() == trackID);
    }

    public int getTotalDuration() {
        int total = 0;
        for (Track track : tracks) {
            total += track.getLengthSec();
        }
        return total;
    }

    @Override
    public String toString() {
        return "model.Album{" +
                "albumID=" + albumID +
                ", title='" + title + '\'' +
                ", artist='" + artist + '\'' +
                ", totalDuration=" + getTotalDuration() +
                ", tracks=" + tracks +
                '}';
    }
}
