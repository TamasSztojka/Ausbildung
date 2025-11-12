import java.time.LocalDate;

public class Coach extends Member{
    private String licenseNumber;
    private String experienceYears;

    public Coach(int memberID, String firstName, String lastName, LocalDate birthDate, String role, String licenseNumber, String experienceYears) {
        super(memberID, firstName, lastName, birthDate, role);
        this.licenseNumber = licenseNumber;
        this.experienceYears = experienceYears;
    }

    public void trainTeam(Team team){
        System.out.println("Coach " + getFullName() + " is training team " + team.getName());
    }

    public void evaluatePlayer(Team team) {
        System.out.println("Coach " + getFullName() + " is evaluating player " + player.getFullName());
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(String experienceYears) {
        this.experienceYears = experienceYears;
    }
}

