public class Bike extends Vehicles {
    private double fuelCapacity;
    private double currentFuel;
    private double consumptionPer100km;
    private boolean helmetAvailable;

    public Bike(String manufacturer, String model, int year, boolean helmetAvailable) {
        super(manufacturer, model, year);
        this.fuelCapacity = 20.0;
        this.currentFuel = 20.0; // starts full
        this.consumptionPer100km = 4.0;
        this.helmetAvailable = helmetAvailable;
    }

    @Override
    public void drive(double kilometers) {
        double consumption = (consumptionPer100km / 100) * kilometers;
        if (currentFuel >= consumption) {
            currentFuel -= consumption;
            super.drive(kilometers);
        } else {
            System.out.println("Not enough fuel!");
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
                + String.format(" | Fuel: %.1f / %.1f L | Helmet: %s",
                currentFuel, fuelCapacity, helmetAvailable ? "Yes" : "No");
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

    public boolean isHelmetAvailable() {
        return helmetAvailable;
    }

    public void setHelmetAvailable(boolean helmetAvailable) {
        this.helmetAvailable = helmetAvailable;
    }
}