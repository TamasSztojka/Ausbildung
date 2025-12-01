public class Employee {
    private int id;                  // for database reference
    private String firstName;
    private String lastName;
    private String branch;
    private String position;
    private String email;

    public Employee(String firstName, String lastName, String branch, String position, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.branch = branch;
        this.position = position;
        this.email = email;
    }

    public Employee(int id, String firstName, String lastName, String branch, String position, String email) {
        this(firstName, lastName, branch, position, email);
        this.id = id;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    @Override
    public String toString() {
        return id + ": " + getFullName() + " (" + position + ", " + branch + ")";
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String vorname) { this.firstName = vorname; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getBranch() { return branch; }
    public void setBranch(String abteilung) { this.branch = abteilung; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}