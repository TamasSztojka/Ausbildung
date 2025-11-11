import java.util.ArrayList;
import java.util.Scanner;

public class Menu {

    public int createMenu(ArrayList<String> entries) {
        Scanner scanner = new Scanner(System.in);
        int counter = 1;
        int choice = 0;

        for (String entry : entries) {
            System.out.printf("%d - %s%n", counter, entry);
            counter++;
        }

        System.out.print("Your choice: ");
        if (scanner.hasNextInt()) {
            choice = scanner.nextInt();
        } else {
            System.out.println("Invalid input!");
            scanner.nextLine();
        }

        return choice;
    }
}