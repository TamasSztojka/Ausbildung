package model;
import java.util.ArrayList;
import java.util.List;

public class MusicLibrary {

    private List<Album> albums = new ArrayList<>();

    public void addAlbum(Album album) {
        albums.add(album);
    }

    public void removeAlbum(int albumID) {
        albums.removeIf(a -> a.getAlbumID() == albumID);
    }

    public Album getAlbum(int albumID) {
        for (Album album : albums) {
            if (album.getAlbumID() == albumID) {
                return album;
            }
        }
        return null;
    }

    public void addTrackToAlbum(int albumID, Track track) {
        Album album = getAlbum(albumID);
        if (album != null) {
            album.addTrack(track);
        }
    }

    public void removeTrackFromAlbum(int albumID, int trackID) {
        Album album = getAlbum(albumID);
        if (album != null) {
            album.removeTrack(trackID);
        }
    }

    public List<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(List<Album> albums) {
        this.albums = albums;
    }

    @Override
    public String toString() {
        return "MusicLibrary{" +
                "albums=" + albums +
                '}';
    }
}