import java.time.LocalDate;
import java.time.Period;

public class Member {
    protected int memberID;
    private String firstName;
    private String lastName;
    private LocalDate birthDate;
    private String role;

    public Member(int memberID, String firstName, String lastName, LocalDate birthDate, String role) {
        this.memberID = memberID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.role = role;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public int getAge() {
        return Period.between(birthDate, LocalDate.now()).getYears();
    }

    public void printMemberInfo() {
        System.out.println("MemberID: " + memberID);
        System.out.println("Name: " + getFullName());
        System.out.println("Role: " + role);
        System.out.println("Age: " + getAge());
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
