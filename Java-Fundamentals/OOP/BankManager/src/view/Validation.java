package view;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class Validation {
    public static int readInt(Scanner scanner, String message){
        System.out.print(message);

        while(!scanner.hasNextInt()){
            scanner.nextLine();
            System.out.print("Invalid number. " + message);
        }

        int value = scanner.nextInt();
        scanner.nextLine();
        return value;
    }

    public static int readIntInRange(Scanner scanner, String message, int min, int max){
        int value;
        do{
            value = readInt(scanner, message);
            if(value < min || value > max){
                System.out.print("Value must be between " + min + " and " + max);
            }
        }
        while(value < min || value > max);

        return value;
    }

    public static int readPositiveInt(Scanner scanner, String message){
        int value;
        do{
            value = readInt(scanner, message);
            if(value < 0){
                System.out.println("Value must be positive");
            }
        }
        while (value <= 0);

        return value;
    }

    public static String readNonEmptyString(Scanner scanner, String message){
        System.out.print(message);
        String input = scanner.nextLine().trim();

        while(input.isEmpty()){
            System.out.print("Input cannot be empty");
            System.out.print(message);
            input = scanner.nextLine().trim();
        }

        return input;
    }

    public static LocalDate readDate(Scanner scanner, String message){
        while(true){
            System.out.print(message);
            String input = scanner.nextLine().trim();

            try{
                return LocalDate.parse(input);
            }
            catch(DateTimeParseException e){
                System.out.println("Invalid date format. Please use YYYY-MM-DD");
            }
        }
    }

    public static double readDouble(Scanner scanner, String message) {
        System.out.print(message);

        while (!scanner.hasNextDouble()) {
            scanner.nextLine();
            System.out.print("Invalid number. " + message);
        }

        double value = scanner.nextDouble();
        scanner.nextLine();
        return value;
    }
}

