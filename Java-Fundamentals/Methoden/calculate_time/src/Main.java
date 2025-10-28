import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter start time (HH:mm): ");
        LocalTime startTime = LocalTime.parse(scanner.nextLine());

        System.out.print("Enter end time (HH:mm): ");
        LocalTime endTime = LocalTime.parse(scanner.nextLine());

        Duration workDuration = Duration.between(startTime, endTime);
        long hours = workDuration.toHours();
        long minutes = workDuration.toMinutes() % 60;

        System.out.println("Working time: " + hours + " hours " + minutes + " minutes");

        System.out.print("\nEnter order date (yyyy-MM-dd): ");
        LocalDate orderDate = LocalDate.parse(scanner.nextLine());

        System.out.print("Enter delivery date (yyyy-MM-dd): ");
        LocalDate deliveryDate = LocalDate.parse(scanner.nextLine());

        long daysBetween = ChronoUnit.DAYS.between(orderDate, deliveryDate);
        System.out.println("Duration between order and delivery: " + daysBetween + " days");
    }
}
