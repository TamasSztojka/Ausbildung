import Controller.ContactsManager;
import tools.Menu;
import Controller.ContactsDB;

void main() {
    Scanner scanner = new Scanner(System.in);
    ContactsDB db = new ContactsDB();

    int choice;

    do {
        ArrayList<String> mainEntries = new ArrayList<>();
        mainEntries.add("1 - Add Contact");
        mainEntries.add("2 - Delete Contact");
        mainEntries.add("3 - Search Contacts");
        mainEntries.add("4 - Show All Contacts");
        mainEntries.add("5 - Exit");

        // Library for menu
        Menu mainMenu = new Menu(mainEntries);
        choice = mainMenu.getChoice(scanner);

        switch(choice) {
            case 1 -> ContactsManager.addContacts(scanner, db);
            case 2 -> ContactsManager.deleteContact(scanner, db);
            case 3 -> ContactsManager.searchContacts(scanner, db);
            case 4 -> ContactsManager.showAllContacts(db);
            case 5 -> System.out.println("Goodbye");
            default -> System.out.println("Invalid choice");

        }
    } while(choice != 5);

    scanner.close();
}

