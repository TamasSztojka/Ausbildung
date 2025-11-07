import java.util.ArrayList;
import java.util.Scanner;

public class Menu {
    private ArrayList<Vehicles> vehicles = new ArrayList<>();
    private Scanner scanner = new Scanner (System.in);

    public void showMainMenu(){
        int choice;

        do{
            IO.println("\n=== VEHICLE MANAGEMENT SYSTME ===");
            IO.println("1. Create new vehicle");
            IO.println("2. List all vehicles");
            IO.println("3. Drive a vehicle");
            IO.println("4. Refuel a vehicle (if applicable)");
            IO.println("0. Exit");
            IO.print("Your choice: ");
            choice = scanner.nextInt();
            scanner.nextLine();

            switch(choice){
                case 1 -> createVehicle();
                case 2 -> listVehicles();
                case 3 -> driveVehicles();
                case 4 -> refuelVehicle();
                case 0 -> IO.println("Exiting Program...");
                default -> IO.println("Invalid choice!");
            }

        }
        while (choice != 0);
    }

    private void createVehicle(){
        IO.println("\nWhich type of vehicle do you want to create?");
        IO.println("1. Car");
        IO.println("2. Truck");
        IO.println("3. Bike");
        IO.println("4. Bicycle");
        IO.println("Choice: ");
        int type = scanner.nextInt();
        scanner.nextLine();

        IO.print("Manufacturer: ");
        String manufacturer = scanner.nextLine();
        IO.println("Model: ");
        String model = scanner.nextLine();
        IO.print("Year: ");
        int year = scanner.nextInt();

        Vehicles vehicle = null;
        switch(type){
            case 1 -> {
                IO.println("Seats: ");
                int seats = scanner.nextInt();
                IO.println("Trunk volume: ");
                double volume = scanner.nextDouble();
                vehicle = new Car(manufacturer, model, year, seats, volume);
            }
            case 2 -> {
                IO.println("Load capacity (kg): ");
                double capacity = scanner.nextDouble();
                vehicle = new Truck(manufacturer, model, year, capacity);
            }
            case 3 -> {
                IO.print("Helmet available? (true/false): ");
                boolean helmet = scanner.nextBoolean();
                vehicle = new Bike(manufacturer, model, year, helmet);

            }
            case 4 -> {
                scanner.nextLine();
                IO.print("Type (e.g. Mountainbike): ");
                String typeName = scanner.nextLine();
                IO.print("Number of gears: ");
                int gears = scanner.nextInt();
                vehicle = new Bicycle(manufacturer, model, year, typeName, gears);
            }
        }
        if (vehicle != null){
            vehicles.add(vehicle);
            IO.println(vehicle.getModel() + " successfully added!");
        }

    }

    private void listVehicles(){
        IO.println("\n=== All Vehicles ===");
        if (vehicles.isEmpty()){
            IO.println("No vehicles created yet.");
        }
        else{
            for (int i = 0; i < vehicles.size(); i++) {
                IO.println((i + 1) + ". " + vehicles.get(i).getInfo());
            }
        }
    }

    private void driveVehicles(){
        if (vehicles.isEmpty()){
            IO.println("No vehicles to drive!");
            return;
        }

        listVehicles();
        IO.print("Select vehicle number: ");
        int index = scanner.nextInt() - 1;

        if (index >= 0 && index < vehicles.size()){
            IO.print("Enter distance to drive (km): ");
            double km = scanner.nextDouble();
            vehicles.get(index).drive(km);
        }
        else{
            IO.println("Invalid vehicle selection!");
        }
    }

    private void refuelVehicle() {
        if (vehicles.isEmpty()) {
            IO.println("No vehicles available!");
            return;
        }

        listVehicles();
        IO.print("Select vehicle number: ");
        int index = scanner.nextInt() - 1;

        if (index >= 0 && index < vehicles.size()) {
            Vehicles vehicle = vehicles.get(index);

            IO.print("Amount of fuel (L): ");
            double amount = scanner.nextDouble();

            if (vehicle instanceof Car car) {
                car.refuel(amount);
            } else if (vehicle instanceof Truck truck) {
                truck.refuel(amount);
            } else if (vehicle instanceof Bike bike) {
                bike.refuel(amount);
            } else {
                IO.println("This vehicle cannot be refueled!");
            }
        } else {
            IO.println("Invalid vehicle selection!");
        }
    }
}
