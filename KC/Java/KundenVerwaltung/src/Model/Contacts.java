package Model;

public class Contacts {
    private final int id;
    private final String name;
    private final String phoneNumber;
    private final String email;

    public Contacts(int id, String name, String phoneNumber, String email) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    //Creates a new contact without an ID because of AUTO_INCREMENT
    public Contacts(String name, String phoneNumber, String email) {

        this(0,name,phoneNumber,email);
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }


    //returns a formatted string
    @Override
    public String toString() {
        String mail = (email == null || email.isBlank()) ? "-" : email;
        return "[" + id + "] " + name + " | " + phoneNumber + " | " + mail;
    }
}

