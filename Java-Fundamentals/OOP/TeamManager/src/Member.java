import java.time.LocalDate;
import java.time.Period;

public class Member {
    protected int memberID;
    private String firstName;
    private String lastName;
    private LocalDate birthDate;
    private String type;

    public Member(int id, String first, String last,
                  LocalDate birth, String type) {
        this.memberID = id;
        this.firstName = first;
        this.lastName = last;
        this.birthDate = birth;
        this.type = type;
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
        System.out.println("Type: " + type);
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

    @Override
    public String toString() {
        return "ID: " + memberID +
                ", Name: " + getFullName() +
                ", Birthdate: " + birthDate +
                ", Type: " + type;
    }
}
