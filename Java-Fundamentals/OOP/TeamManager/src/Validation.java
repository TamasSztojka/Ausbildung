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
}
