import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

void main() {
    Scanner scanner = new Scanner(System.in);

    Club club = new Club("Elite Sports Club", "123 Main Street");

    int choice;

    do {
        ArrayList<String> mainEntries = new ArrayList<>();
        mainEntries.add("1 - Add member");
        mainEntries.add("2 - Add team");
        mainEntries.add("3 - Show all members");
        mainEntries.add("4 - Show all teams");
        mainEntries.add("5 - Manage Members");
        mainEntries.add("6 - Exit");

        Menu mainMenu = new Menu(mainEntries);
        choice = mainMenu.getChoice();

        switch (choice) {
            case 1 -> MenuManager.addMemberMenu(scanner, club);
            case 2 -> MenuManager.addTeam(scanner, club);
            case 3 -> MenuManager.showAllMembers(club);
            case 4 -> MenuManager.showAllTeams(club);
            case 5 -> MenuManager.manageMembersMenu(scanner, club);
            case 6 -> System.out.println("Exiting program...");
            default -> System.out.println("Invalid choice!");
        }
    } while (choice != 5);
}

