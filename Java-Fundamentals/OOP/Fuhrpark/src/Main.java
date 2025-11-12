import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Database.initialize();

        VehicleManager manager = new VehicleManager();
        Menu menu = new Menu();

        String entries = "Create new vehicle,Show all vehicles,Drive a vehicle,Refuel a vehicle,Load/Unload Truck,Exit";
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
                case 6 -> System.out.println("Exiting program...");
                default -> System.out.println("Invalid choice!");
            }
        } while (choice != 6);
    }
}
