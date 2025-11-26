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

        String firstName = Validation.readNonEmptyString(scanner, "Enter first name: ");
        String lastName = Validation.readNonEmptyString(scanner, "Enter last name: ");
        LocalDate birthDate = Validation.readDate(scanner, "Enter birth date: ");
        String position = Validation.readNonEmptyString(scanner, "Enter position: ");

        int number = Validation.readIntInRange(scanner, "Enter shirt number (1-99): ", 1, 99);


        Player player = new Player(firstName, lastName, birthDate, position, number);
        club.addMember(player);

        System.out.println("Player created successfully! Assigned ID: " + player.getMemberID());
    }

    private static void createCoach(Scanner scanner, Club club) {

        String firstName = Validation.readNonEmptyString(scanner, "Enter first name: ");
        String lastName = Validation.readNonEmptyString(scanner, "Enter last name: ");
        LocalDate birthDate = Validation.readDate(scanner, "Enter birth date: (YYYY-MM-DD): ");
        String license = Validation.readNonEmptyString(scanner, "Enter license number: ");

        int experience = Validation.readPositiveInt(scanner, "Enter years of experiecen: ");



        Coach coach = new Coach(firstName, lastName, birthDate, license, experience);
        club.addMember(coach);

        System.out.println("Coach created successfully! Assigned ID: " + coach.getMemberID());
    }

    public static void addTeam(Scanner scanner, Club club) {

        String name = Validation.readNonEmptyString(scanner, "Enter team name: ");
        Team team = new Team(name);
        club.addTeam(team);

        System.out.println("Team created successfully! Assigned ID: " + team.getTeamID());
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

        int goals = Validation.readPositiveInt(scanner, "Enter goals to add: ");
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
        int id = Validation.readPositiveInt(scanner, "Enter player ID to " + action + ": ");
        Member member = findMemberById(club, id);
        return (member instanceof Player) ? (Player) member : null;
    }

    private static Coach selectCoach(Scanner scanner, Club club, String action) {
        printCoaches(club);
        int id = Validation.readPositiveInt(scanner, "Enter coach ID to " + action + ": ");
        Member member = findMemberById(club, id);
        return (member instanceof Coach) ? (Coach)member : null;
    }

    private static Team selectTeam(Scanner scanner, Club club, String action) {
        printTeams(club);
        int id = Validation.readPositiveInt(scanner, "Enter team ID to " + action + ": ");
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

    public static void showAllMembers(Club club) {
        club.getMembers().forEach(System.out::println);
    }

    public static void showAllTeams(Club club){
        club.getTeams().forEach(System.out::println);
    }


}

