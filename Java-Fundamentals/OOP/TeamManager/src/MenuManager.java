import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class MenuManager {

    public static void addMemberMenu(Scanner scanner, Club club) {
        String entries = "1 - Create player,2 - Create coach,3 - Back";
        ArrayList<String> subMenu = new ArrayList<>(Arrays.asList(entries.split(",")));

        Menu m = new Menu(subMenu);
        int choice = m.getChoice();

        switch (choice) {
            case 1 -> createPlayer(scanner, club);
            case 2 -> createCoach(scanner, club);
            case 3 -> System.out.println("Returning to main menu...");
            default -> System.out.println("Invalid choice!");
        }
    }

    private static void createPlayer(Scanner scanner, Club club) {

        System.out.print("Enter first name: ");
        String firstName = scanner.nextLine();
        System.out.print("Enter last name: ");
        String lastName = scanner.nextLine();
        System.out.print("Enter birth date (YYYY-MM-DD): ");
        String dateInput = scanner.nextLine();
        LocalDate birthDate = LocalDate.parse(dateInput);
        System.out.print("Enter position: ");
        String position = scanner.nextLine();
        System.out.print("Enter shirt number: ");
        int number = scanner.nextInt();


        Player player = new Player(firstName, lastName, birthDate, position, number);
        club.addMember(player);

        System.out.println("Player created successfully! Assigned ID: " + player.getMemberID());
    }

    private static void createCoach(Scanner scanner, Club club) {

        System.out.print("Enter first name: ");
        String firstName = scanner.nextLine();
        System.out.print("Enter last name: ");
        String lastName = scanner.nextLine();
        System.out.print("Enter birth date (YYYY-MM-DD): ");
        String dateInput = scanner.nextLine();
        LocalDate birthDate = LocalDate.parse(dateInput);
        System.out.print("Enter license number: ");
        String license = scanner.nextLine();
        System.out.print("Enter experience years: ");
        int exp = scanner.nextInt();

        Coach coach = new Coach(firstName, lastName, birthDate, license, exp);
        club.addMember(coach);

        System.out.println("Coach created successfully! Assigned ID: " + coach.getMemberID());
    }

    public static void addTeam(Scanner scanner, Club club) {
        scanner.nextLine();

        System.out.print("Enter team name: ");
        String name = scanner.nextLine();
        Team team = new Team(name);
        club.addTeam(team);

        System.out.println("Team created successfully! Assigned ID: " + team.getTeamID());
    }

    public static void showAllMembers(Club club) {
        IO.println("\n=== All Members ===");

        for (Member member : club.getMembers()) {
            IO.println(
                    member.getMemberID() + " - " + member.getFullName() + " (" + member.getRole() + ")"
            );
        }
    }

    public static void showAllTeams(Club club) {
        IO.println("\n=== All Teams ===");

        for (Team team : club.getTeams()) {
            IO.println(
                    team.getTeamID() + " - " + team.getName()
            );
        }
    }

    public static void manageMembersMenu(Scanner scanner, Club club) {

        String entries = "1 - Manage players,2 - Manage coaches,3 - Back";
        ArrayList<String> subMenu = new ArrayList<>(Arrays.asList(entries.split(",")));

        Menu m = new Menu(subMenu);
        int choice = m.getChoice();

        switch (choice) {
            case 1 -> managePlayersMenu(scanner, club);
            case 2 -> manageCoachesMenu(scanner, club);
            case 3 -> System.out.println("Returning to main menu...");
            default -> System.out.println("Invalid choice!");
        }
    }

    public static void managePlayersMenu(Scanner scanner, Club club) {

        String entries = "1 - Remove player from club,2 - Update player goals,3 - Assign player to team,4 - Remove player from team,5 - Back";
        ArrayList<String> subMenu = new ArrayList<>(Arrays.asList(entries.split(",")));

        Menu m = new Menu(subMenu);
        int choice = m.getChoice();

        switch (choice) {
            case 1 -> removePlayer(scanner, club);
            case 2 -> updatePlayerGoals(scanner, club);
            case 3 -> assignPlayerToTeam(scanner, club);
            case 4 -> removePlayerFromTeam(scanner, club);
            case 5 -> System.out.println("Returning...");
            default -> System.out.println("Invalid choice!");
        }
    }

    public static void manageCoachesMenu(Scanner scanner, Club club) {

        String entries = "1 - Schedule training session,2 - Schedule player evaluation,3 - Assign coach to team,4 - Remove coach from team,5 - Remove coach from club,6 - Back";
        ArrayList<String> subMenu = new ArrayList<>(Arrays.asList(entries.split(",")));

        Menu m = new Menu(subMenu);
        int choice = m.getChoice();

        switch (choice) {
            case 1 -> scheduleTraining(scanner, club);
            case 2 -> scheduleEvaluation(scanner, club);
            case 3 -> assignCoachToTeam(scanner, club);
            case 4 -> removeCoachFromTeam(scanner, club);
            case 5 -> removeCoach(scanner, club);
            case 6 -> System.out.println("Returning...");
            default -> System.out.println("Invalid choice!");
        }
    }

    private static void removePlayer(Scanner scanner, Club club) {
        Player player = selectPlayer(scanner, club, "remove");
        if (player == null) return;

        club.getTeams().forEach(team -> team.getMembers().remove(player));
        club.getMembers().remove(player);

        System.out.println("Player removed.");
    }

    private static void updatePlayerGoals(Scanner scanner, Club club) {
        Player player = selectPlayer(scanner, club, "update goals for");
        if (player == null) return;

        int goals = readInt(scanner, "Enter goals to add: ");
        player.updateGoals(goals);

        System.out.println("Goals updated!");
    }

    private static void assignPlayerToTeam(Scanner scanner, Club club) {
        Player player = selectPlayer(scanner, club, "assign");
        if (player == null) return;

        Team team = selectTeam(scanner, club, "assign player to");
        if (team == null) return;

        team.addMember(player);
        System.out.println("Player assigned.");
    }

    private static void removePlayerFromTeam(Scanner scanner, Club club) {
        Player player = selectPlayer(scanner, club, "remove from team");
        if (player == null) return;

        Team team = selectTeam(scanner, club, "remove from");
        if (team == null) return;

        team.removeMember(player);
        System.out.println("Player removed from team.");
    }

    private static void scheduleTraining(Scanner scanner, Club club) {
        Coach coach = selectCoach(scanner, club, "train a team");
        if (coach == null) return;

        Team team = selectTeam(scanner, club, "train");
        if (team == null) return;

        coach.trainTeam(team);
    }

    private static void scheduleEvaluation(Scanner scanner, Club club) {
        Coach coach = selectCoach(scanner, club, "evaluate a player");
        if (coach == null) return;

        Player player = selectPlayer(scanner, club, "evaluate");
        if (player == null) return;

        coach.evaluatePlayer(player);
    }

    private static void assignCoachToTeam(Scanner scanner, Club club) {
        Coach coach = selectCoach(scanner, club, "assign");
        if (coach == null) return;

        Team team = selectTeam(scanner, club, "assign coach to");
        if (team == null) return;

        team.setCoach(coach);
        System.out.println("Coach assigned.");
    }

    private static void removeCoachFromTeam(Scanner scanner, Club club) {
        Team team = selectTeam(scanner, club, "remove coach from");
        if (team == null) return;

        team.setCoach(null);
        System.out.println("Coach removed.");
    }

    private static void removeCoach(Scanner scanner, Club club) {
        Coach coach = selectCoach(scanner, club, "remove");
        if (coach == null) return;

        club.getTeams().forEach(t -> {
            if (t.getCoach() == coach) t.setCoach(null);
        });

        club.getMembers().remove(coach);

        System.out.println("Coach removed.");
    }

    private static Player selectPlayer(Scanner scanner, Club club, String action) {
        printPlayers(club);
        int id = readInt(scanner, "Enter player ID to " + action + ": ");
        Member m = findMemberById(club, id);
        return (m instanceof Player) ? (Player)m : null;
    }

    private static Coach selectCoach(Scanner scanner, Club club, String action) {
        printCoaches(club);
        int id = readInt(scanner, "Enter coach ID to " + action + ": ");
        Member m = findMemberById(club, id);
        return (m instanceof Coach) ? (Coach)m : null;
    }

    private static Team selectTeam(Scanner scanner, Club club, String action) {
        printTeams(club);
        int id = readInt(scanner, "Enter team ID to " + action + ": ");
        return findTeamById(club, id);
    }

    private static void printPlayers(Club club) {
        System.out.println("\n=== Players ===");
        club.getMembers().stream()
                .filter(member -> member instanceof Player)
                .forEach(System.out::println);
    }

    private static void printCoaches(Club club) {
        System.out.println("\n=== Coaches ===");
        club.getMembers().stream()
                .filter(member -> member instanceof Coach)
                .forEach(System.out::println);
    }

    private static void printTeams(Club club) {
        System.out.println("\n=== Teams ===");
        club.getTeams().forEach(System.out::println);
    }

    private static Member findMemberById(Club club, int id) {
        return club.getMembers().stream()
                .filter(member -> member.getMemberID() == id)
                .findFirst()
                .orElse(null);
    }

    private static Team findTeamById(Club club, int id) {
        return club.getTeams().stream()
                .filter(team -> team.getTeamID() == id)
                .findFirst()
                .orElse(null);
    }

    private static int readInt(Scanner scanner, String message) {
        System.out.print(message);
        while (!scanner.hasNextInt()) {
            scanner.nextLine();
            System.out.print("Invalid input. " + message);
        }
        int value = scanner.nextInt();
        scanner.nextLine();
        return value;
    }
}

