package Controller;
import Model.Contacts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.io.InputStream;
import java.util.Properties;

public class ContactsDB {
    private final String url;
    private final String user;
    private final String pass;

    //Loads credentials from db.properties
    public ContactsDB() {
        Properties p = new Properties();
        try (InputStream in = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            if (in == null) throw new IllegalStateException("db.properties not found in resources");
            p.load(in);
        } catch (Exception e) {
            throw new RuntimeException("Failed to load db.properties", e);
        }

        String host = p.getProperty("db.host", "localhost");
        String port = p.getProperty("db.port", "3306");
        String name = p.getProperty("db.name", "kundenverwaltung");
        String params = p.getProperty("db.params", "useSSL=false&serverTimezone=UTC");

        this.url  = "jdbc:mysql://" + host + ":" + port + "/" + name + "?" + params;
        this.user = p.getProperty("db.user", "root");
        this.pass = p.getProperty("db.pass", "");
    }

    //Creates and returns a new database connection
    private Connection getConnection() throws SQLException {
        return  DriverManager.getConnection(url, user, pass);
    }

    //Inserts a new contact into the database and returns the generated ID
    public int insertContacts(Contacts contacts) throws SQLException {
        String sql = "INSERT INTO contacts(name, phoneNumber, email) VALUES (?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){

            ps.setString(1, contacts.getName());
            ps.setString(2, contacts.getPhoneNumber());

            if (contacts.getEmail() == null || contacts.getEmail().isBlank()) {
                ps.setNull(3, Types.VARCHAR);
            }
            else {
                ps.setString(3, contacts.getEmail());
            }

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()){
                if (rs.next()) return rs.getInt(1);
            }
        }

        return -1;
    }

    //Retrieves all contacts from the database, ordered by ID
    public List<Contacts> getAllContacts() throws SQLException {
        String sql = "SELECT id, name, phoneNumber, email FROM contacts ORDER BY id";
        List<Contacts> contacts = new ArrayList<>();

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()){

            while (rs.next()) {
                contacts.add(new Contacts(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("phoneNumber"),
                        rs.getString("email")
                ));
            }
        }
        return contacts;
    }

    // Searches for contacts whose name matches the input
    public List<Contacts> searchContactsByName(String nameLike) throws SQLException {
        String sql = "SELECT id, name, phoneNumber, email FROM contacts WHERE name LIKE ?";
        List<Contacts> contacts = new ArrayList<>();

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)){
            ps.setString(1, "%" + nameLike + "%");
            try (ResultSet rs = ps.executeQuery()){
                while (rs.next()) {
                    contacts.add(new Contacts(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("phoneNumber"),
                            rs.getString("email")
                    ));
                }
            }
        }
        return contacts;
    }

    // Deletes a contact by its ID and returns true if a record was removed.
    public boolean deleteContactsByID(int id) throws SQLException {
        String sql = "DELETE FROM contacts WHERE id = ?";

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(sql)){
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}
