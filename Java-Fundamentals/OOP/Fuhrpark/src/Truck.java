public class Truck extends Vehicles {
    private double loadCapacity;
    private double currentLoad;
    private double fuelCapacity;
    private double currentFuel;
    private double consumptionPer100km;

    public Truck(String manufacturer, String model, int year, double loadCapacity) {
        super(manufacturer, model, year);
        this.loadCapacity = loadCapacity;
        this.currentLoad = 0.0;
        this.fuelCapacity = 150.0;
        this.currentFuel = 150.0; // full tank
        this.consumptionPer100km = 25.0;
    }

    @Override
    public void drive(double kilometers) {
        double extraLoadFactor = currentLoad / loadCapacity;
        double adjustedConsumption =
                (consumptionPer100km / 100) * kilometers * (1 + extraLoadFactor * 0.2);

        if (currentFuel >= adjustedConsumption) {
            currentFuel -= adjustedConsumption;
            super.drive(kilometers);

            System.out.printf("%s drove %.1f km. Remaining fuel: %.1f / %.1f L (Load: %.1f / %.1f kg)%n",
                    getModel(), kilometers, currentFuel, fuelCapacity, currentLoad, loadCapacity);
        } else {
            System.out.println("Not enough fuel for this trip! (" + getModel() + ")");
        }
    }

    public void refuel(double amount) {
        currentFuel += amount;
        if (currentFuel > fuelCapacity) currentFuel = fuelCapacity;
        System.out.printf("%s refueled by %.1f L (now %.1f / %.1f L)%n",
                getModel(), amount, currentFuel, fuelCapacity);
    }

    @Override
    public String getInfo() {
        return super.getInfo()
                + String.format(" | Fuel: %.1f / %.1f L | Load: %.1f / %.1f kg",
                currentFuel, fuelCapacity, currentLoad, loadCapacity);
    }

    public void load(double weight) {
        if (currentLoad + weight <= loadCapacity) {
            currentLoad += weight;
            System.out.println(weight + " kg loaded. Current load: " + currentLoad + " kg.");
        } else {
            System.out.println("Load too heavy! Max capacity: " + loadCapacity + " kg.");
        }
    }

    public void unload(double weight) {
        if (weight <= currentLoad) {
            currentLoad -= weight;
            System.out.println(weight + " kg unloaded. Remaining load: " + currentLoad + " kg.");
        } else {
            System.out.println("Cannot unload more than current load!");
        }
    }

    public double getCurrentLoad() {
        return currentLoad;
    }

    public void setCurrentLoad(double currentLoad) {
        this.currentLoad = currentLoad;
    }

    public double getLoadCapacity() {
        return loadCapacity;
    }

    public void setLoadCapacity(double loadCapacity) {
        this.loadCapacity = loadCapacity;
    }

    public double getFuelCapacity() {
        return fuelCapacity;
    }

    public void setFuelCapacity(double fuelCapacity) {
        this.fuelCapacity = fuelCapacity;
    }

    public double getCurrentFuel() {
        return currentFuel;
    }

    public void setCurrentFuel(double currentFuel) {
        this.currentFuel = currentFuel;
    }

    public double getConsumptionPer100km() {
        return consumptionPer100km;
    }

    public void setConsumptionPer100km(double consumptionPer100km) {
        this.consumptionPer100km = consumptionPer100km;
    }
}