import java.util.ArrayList;
import java.util.Scanner;

public class VehicleManager {
    private final ArrayList<Vehicles> vehicles;
    private final Scanner scanner = new Scanner(System.in);

    public VehicleManager() {
        vehicles = Database.loadVehicles(); // load once at startup
        System.out.println("Vehicle list loaded. " + vehicles.size() + " vehicles in memory.");
    }

    public void createVehicle() {
        System.out.println("\nSelect vehicle type:");
        System.out.println("1 - Car");
        System.out.println("2 - Truck");
        System.out.println("3 - Motorcycle");
        System.out.println("4 - Bicycle");
        System.out.print("Your choice: ");
        int type = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Manufacturer: ");
        String manufacturer = scanner.nextLine();
        System.out.print("Model: ");
        String model = scanner.nextLine();
        System.out.print("Year: ");
        int year = scanner.nextInt();

        Vehicles vehicle = null;
        switch (type) {
            case 1 -> {
                System.out.print("Seats: ");
                int seats = scanner.nextInt();
                System.out.print("Trunk volume: ");
                double trunkVolume = scanner.nextDouble();
                vehicle = new Car(manufacturer, model, year, seats, trunkVolume);
            }
            case 2 -> {
                System.out.print("Load capacity (kg): ");
                double capacity = scanner.nextDouble();
                vehicle = new Truck(manufacturer, model, year, capacity);
            }
            case 3 -> {
                System.out.print("Helmet available? (true/false): ");
                boolean helmet = scanner.nextBoolean();
                vehicle = new Bike(manufacturer, model, year, helmet);
            }
            case 4 -> {
                scanner.nextLine();
                System.out.print("Type (e.g. Mountain bike): ");
                String typeName = scanner.nextLine();
                System.out.print("Number of gears: ");
                int gears = scanner.nextInt();
                vehicle = new Bicycle(manufacturer, model, year, typeName, gears);
            }
            default -> System.out.println("Invalid choice!");
        }

        if (vehicle != null) {
            vehicles.add(vehicle);
            Database.saveVehicle(vehicle);
            System.out.println(vehicle.getModel() + " successfully added!");
        }
    }

    public void listVehicles() {
        System.out.println("\n=== All Vehicles ===");
        if (vehicles.isEmpty()) {
            System.out.println("No vehicles created yet.");
        } else {
            for (int i = 0; i < vehicles.size(); i++) {
                System.out.println((i + 1) + ". " + vehicles.get(i).getInfo());
            }
            System.out.println();
        }
    }

    public void driveVehicle() {
        if (vehicles.isEmpty()) {
            System.out.println("No vehicles to drive!");
            return;
        }

        listVehicles();
        System.out.print("Select vehicle number: ");
        int index = scanner.nextInt() - 1;

        if (index >= 0 && index < vehicles.size()) {
            System.out.print("Enter distance to drive (km): ");
            double km = scanner.nextDouble();
            Vehicles selected = vehicles.get(index);
            selected.drive(km);
            Database.updateVehicle(selected);
        } else {
            System.out.println("Invalid vehicle selection!");
        }
    }

    public void refuelVehicle() {
        if (vehicles.isEmpty()) {
            System.out.println("No vehicles to refuel!");
            return;
        }

        listVehicles();
        System.out.print("Select vehicle number: ");
        int index = scanner.nextInt() - 1;

        if (index >= 0 && index < vehicles.size()) {
            Vehicles selected = vehicles.get(index);
            System.out.print("Amount of fuel (L): ");
            double amount = scanner.nextDouble();

            if (selected instanceof Car car) {
                car.refuel(amount);
            } else if (selected instanceof Truck truck) {
                truck.refuel(amount);
            } else if (selected instanceof Bike bike) {
                bike.refuel(amount);
            } else {
                System.out.println("This vehicle type doesn’t use fuel.");
                return;
            }

            Database.updateVehicle(selected);
        } else {
            System.out.println("Invalid vehicle selection!");
        }
    }

    public void manageTruckLoad() {
        if (vehicles.isEmpty()) {
            System.out.println("No vehicles to manage!");
            return;
        }

        listVehicles();
        System.out.print("Select vehicle number: ");
        int index = scanner.nextInt() - 1;

        if (index < 0 || index >= vehicles.size()) {
            System.out.println("Invalid selection!");
            return;
        }

        Vehicles v = vehicles.get(index);
        if (!(v instanceof Truck truck)) {
            System.out.println("Selected vehicle is not a truck!");
            return;
        }

        System.out.println("\n1 - Load truck");
        System.out.println("2 - Unload truck");
        System.out.print("Your choice: ");
        int action = scanner.nextInt();

        switch (action) {
            case 1 -> {
                System.out.print("Enter weight to load (kg): ");
                double weight = scanner.nextDouble();
                truck.load(weight);
                Database.updateVehicle(truck); // save new load to DB
            }
            case 2 -> {
                System.out.print("Enter weight to unload (kg): ");
                double weight = scanner.nextDouble();
                truck.unload(weight);
                Database.updateVehicle(truck);
            }
            default -> System.out.println("Invalid action!");
        }
    }
}