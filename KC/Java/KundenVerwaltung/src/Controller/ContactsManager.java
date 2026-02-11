package Controller;

import Model.Contacts;
import tools.Validation;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class ContactsManager {

    //Adds a new contact to the database after validating user input.
    public static void addContacts(Scanner scanner, ContactsDB db) {
        System.out.println("\n=== Add Contacts ===");

        String name = Validation.readNonEmptyString(scanner, "Name: ");
        String tel  = Validation.readPhoneNumber(scanner, "PhoneNumber: ");
        String email = Validation.readEmail(scanner, "Email (optional, press Enter to skip): ");

        try {
            int newId = db.insertContacts(new Contacts(name, tel, email));
            System.out.println("Contact created with ID: " + newId + "\n");
        } catch (SQLException e) {
            System.out.println("Error inserting Contact: " + e.getMessage() + "\n");
        }
    }

    // Deletes a contact from the database using the provided contact ID.
    public static void deleteContact(Scanner scanner, ContactsDB db) {
        System.out.println("\n=== Delete contact ===");

        int id = Validation.readPositiveInt(scanner, "contact ID: ");

        try {
            boolean deleted = db.deleteContactsByID(id);
            System.out.println(deleted ? "contact removed.\n" : "contact not found.\n");
        } catch (SQLException e) {
            System.out.println("Error deleting contacts: " + e.getMessage() + "\n");
        }
    }

    // Searches for contacts whose names contain the given query string.
    public static void searchContacts(Scanner scanner, ContactsDB db) {
        System.out.println("\n=== Search contacts ===");

        String query = Validation.readNonEmptyString(scanner, "Name contains: ");

        try {
            List<Contacts> hits = db.searchContactsByName(query);

            if (hits.isEmpty()) {
                System.out.println("No matches.\n");
                return;
            }

            for (Contacts c : hits) {
                System.out.println(" - " + c);
            }
            System.out.println();
        } catch (SQLException e) {
            System.out.println("Error searching contacts: " + e.getMessage() + "\n");
        }
    }

    // Retrieves and displays all contacts stored in the database.
    public static void showAllContacts(ContactsDB db) {
        System.out.println("\n=== All Contacts ===");

        try {
            List<Contacts> contacts = db.getAllContacts();

            if (contacts.isEmpty()) {
                System.out.println("No contacts available.\n");
                return;
            }

            for (Contacts c : contacts) {
                System.out.println(" - " + c);
            }
            System.out.println();
        } catch (SQLException e) {
            System.out.println("Error reading contacts: " + e.getMessage() + "\n");
        }
    }
}
