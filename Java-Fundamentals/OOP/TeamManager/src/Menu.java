import java.util.ArrayList;
import java.util.Scanner;

public class Menu {

    public Menu(ArrayList<String> list_of_entries) {

        for (var entries : list_of_entries) {
            IO.println(entries);
        }
    }

    public int getChoice() {
        Scanner scanner = new Scanner(System.in);
        IO.print("Your choice: ");

        if (scanner.hasNextInt()) {
            int choice = scanner.nextInt();
            IO.println("");
            return choice;
        }

        IO.println("Invalid input.");
        scanner.nextLine();
        return -1;
    }
}