import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        Club club = new Club("Elite Sports Club", "123 Main Street");
        Management management = new Management(club);
        Menu menu = new Menu();


        String entries = "Add member,Add team,Show all members,Show all teams,Exit";
        String[] entriesSplit = entries.split(",");
        ArrayList<String> myMenuEntries = new ArrayList<>(Arrays.asList(entriesSplit));

        int choice;
        do {
            System.out.println("\n===== TEAM MANAGEMENT SYSTEM =====");
            choice = menu.createMenu(myMenuEntries);

            switch (choice) {
                case 1 -> addMember(scanner, club);
                case 2 -> addTeam(scanner, club);
                case 3 -> management.displayAllMembers();
                case 4 -> management.displayAllTeams();
                case 5 -> System.out.println("Exiting program...");
                default -> System.out.println("Invalid choice!");
            }
        } while (choice != 5);
    }
}
