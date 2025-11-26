import tools.Menu;

void main() {

    Scanner scanner = new Scanner(System.in);

    Bank bank = new Bank();

    int choice;

    do {
        ArrayList<String> mainEntries = new ArrayList<>();
        mainEntries.add("1 - Create Account");
        mainEntries.add("2 - Delete Account");
        mainEntries.add("3 - Deposit");
        mainEntries.add("4 - Withdraw");
        mainEntries.add("5 - Show Account");
        mainEntries.add("6 - Show All Accounts");
        mainEntries.add("7 - Exit");

        Menu mainMenu = new Menu(mainEntries);
        choice = mainMenu.getChoice();

        switch (choice) {
            case 1 -> MenuManager.createAccount(scanner, bank);
            case 2 -> MenuManager.deleteAccount(scanner, bank);
            case 3 -> MenuManager.deposit(scanner, bank);
            case 4 -> MenuManager.withdraw(scanner, bank);
            case 5 -> MenuManager.showAccount(scanner, bank);
            case 6 -> MenuManager.showAllAccounts(bank);
            case 7 -> {
                System.out.println("Goodbye!");
            }
            default -> System.out.println("Invalid choice!");
        }

    } while (choice != 7);
}
