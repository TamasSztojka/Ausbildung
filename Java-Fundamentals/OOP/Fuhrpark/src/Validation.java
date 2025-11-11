import java.util.Locale;
import java.util.Scanner;

public class Validation {

    private static final Scanner scanner = new Scanner(System.in).useLocale(Locale.US);

    public static int readInt(String message, int min, int max) {
        int value;
        while (true) {
            System.out.print(message);
            try {
                value = Integer.parseInt(scanner.nextLine().trim());
                if (value < min || value > max) {
                    System.out.printf("Please enter a number between %d and %d.%n", min, max);
                } else {
                    return value;
                }
            } catch (NumberFormatException e) {
                System.out.println("Invalid input! Please enter a whole number.");
            }
        }
    }

    public static double readDouble(String message, double min, double max) {
        double value;
        while (true) {
            System.out.print(message);
            try {
                String input = scanner.nextLine().trim().replace(',', '.');
                value = Double.parseDouble(input);
                if (value < min || value > max) {
                    System.out.printf("Please enter a number between %.2f and %.2f.%n", min, max);
                } else {
                    return value;
                }
            } catch (NumberFormatException e) {
                System.out.println("Invalid input! Please enter a decimal number (e.g., 3.5).");
            }
        }
    }

    public static boolean readBoolean(String message) {
        while (true) {
            System.out.print(message + " (true/false): ");
            String input = scanner.nextLine().trim().toLowerCase();
            if (input.equals("true") || input.equals("t") || input.equals("yes") || input.equals("y")) return true;
            if (input.equals("false") || input.equals("f") || input.equals("no") || input.equals("n")) return false;
            System.out.println("Invalid input! Please type 'true' or 'false'.");
        }
    }

    public static String readString(String message) {
        while (true) {
            System.out.print(message);
            String input = scanner.nextLine().trim();
            if (!input.isEmpty()) return input;
            System.out.println("Input cannot be empty! Please try again.");
        }
    }
}
