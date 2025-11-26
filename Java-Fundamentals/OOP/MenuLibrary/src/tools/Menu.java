package tools;

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
        System.out.print("Your choice: ");

        if (scanner.hasNextInt()) {
            int choice = scanner.nextInt();
            System.out.println("");
            return choice;
        }

        System.out.println("Invalid input.");
        scanner.nextLine();
        return -1;
    }
}
