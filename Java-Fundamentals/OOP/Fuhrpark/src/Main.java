import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Database.initialize();

        VehicleManager manager = new VehicleManager();
        EmployeeManager employeeManager = new EmployeeManager();

        Menu menu = new Menu();

        String entries = "Create new vehicle,Show all vehicles,Drive a vehicle,Refuel a vehicle,Load/Unload Truck,Manage Employees,Exit";
        String[] entriesSplit = entries.split(",");
        ArrayList<String> myMenuEntries = new ArrayList<>(Arrays.asList(entriesSplit));


        int choice;
        do {
            choice = menu.createMenu(myMenuEntries);

            switch (choice) {
                case 1 -> manager.createVehicle();
                case 2 -> manager.listVehicles();
                case 3 -> manager.driveVehicle();
                case 4 -> manager.refuelVehicle();
                case 5 -> manager.manageTruckLoad();
                case 6 -> {
                    System.out.println("\n1 - Create employee");
                    System.out.println("2 - List all employees");
                    int subChoice = new Scanner(System.in).nextInt();
                    switch (subChoice) {
                        case 1 -> employeeManager.createEmployee();
                        case 2 -> employeeManager.listEmployees();
                    }
                }
                case 7 -> System.out.println("Exiting program...");
                default -> System.out.println("Invalid choice!");
            }

        } while (choice != 7);
    }
}
