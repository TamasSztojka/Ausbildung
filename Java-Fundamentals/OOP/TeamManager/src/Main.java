void main(){
    public class Main {
        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);

            // Initialize club and management
            Club club = new Club("Elite Sports Club", "123 Main Street");
            Management management = new Management(club);
            Menu menu = new Menu();

            // Define menu options
            String entries = "Add new member,Add new coach,Add new player,Add new team,Show all members,Show all teams,Exit";
            String[] entriesSplit = entries.split(",");
            ArrayList<String> myMenuEntries = new ArrayList<>(Arrays.asList(entriesSplit));

            int choice;
            do {
                System.out.println("\n===== TEAM MANAGEMENT SYSTEM =====");
                choice = menu.createMenu(myMenuEntries);

                switch (choice) {
                    case 1 -> addMember(scanner, club);
                    case 2 -> addCoach(scanner, club);
                    case 3 -> addPlayer(scanner, club);
                    case 4 -> addTeam(scanner, club);
                    case 5 -> management.displayAllMembers();
                    case 6 -> management.displayAllTeams();
                    case 7 -> System.out.println("Exiting program...");
                    default -> System.out.println("Invalid choice!");
                }
            } while (choice != 7);
        }
}
