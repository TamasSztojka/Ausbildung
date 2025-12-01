package model;
public class Track {

    private static int nextID = 1;

    private int trackID;
    private String title;
    private String fileName;
    private int lengthSec;

    public Track(String title, String fileName, int lengthSec) {
        this.trackID = nextID++;
        this.title = title;
        this.fileName = fileName;
        this.lengthSec = lengthSec;
    }

    public int getTrackID() {
        return trackID;
    }

    public void setTrackID(int trackID) {
        this.trackID = trackID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getLengthSec() {
        return lengthSec;
    }

    public static void setNextID(int id) {
        nextID = id;
    }

    public void setLengthSec(int lengthSec) {
        this.lengthSec = lengthSec;
    }

    @Override
    public String toString() {
        return "Track{" +
                "trackID=" + trackID +
                ", title='" + title + '\'' +
                ", fileName='" + fileName + '\'' +
                ", lengthSec=" + lengthSec +
                '}';
    }
}
