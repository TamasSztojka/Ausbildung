import java.time.LocalDate;

public class Coach extends Member {
    private static int nextCoachId = 1;
    private String licenseNumber;
    private int experienceYears;

    public Coach(String firstName, String lastName, LocalDate birthDate,
                 String licenseNumber, int experienceYears) {
        super(nextCoachId++, firstName, lastName, birthDate, "Coach");
        this.licenseNumber = licenseNumber;
        this.experienceYears = experienceYears;
    }

    public void trainTeam(Team team){
        System.out.println("Coach " + getFullName() + " is scheduled to train team " + team.getName());
    }

    public void evaluatePlayer(Player player) {
        System.out.println("Coach " + getFullName() + " is scheduled to evaluate player " + player.getFullName());
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    @Override
    public String toString() {
        return "Coach → ID: " + getMemberID() +
                ", Name: " + getFullName() +
                ", License: " + licenseNumber +
                ", Experience: " + experienceYears + " years";
    }
}

