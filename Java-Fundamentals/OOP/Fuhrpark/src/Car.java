public class Car extends Vehicles {
    private int numberOfSeats;
    private double trunkVolume;
    private double fuelCapacity;
    private double currentFuel;
    private double consumptionPer100km;

    public Car(String manufacturer, String model, int year, int numberOfSeats, double trunkVolume) {
        super(manufacturer, model, year);
        this.numberOfSeats = numberOfSeats;
        this.trunkVolume = trunkVolume;
        this.fuelCapacity = 50.0;
        this.currentFuel = 50.0;
        this.consumptionPer100km = 7.0;
    }

    @Override
    public void drive(double kilometers) {
        double consumption = (consumptionPer100km / 100) * kilometers;

        if (currentFuel >= consumption) {
            currentFuel -= consumption;
            super.drive(kilometers); // handles mileage + generic print

            System.out.printf("%s remaining fuel: %.1f / %.1f L%n",
                    getModel(), currentFuel, fuelCapacity);
        } else {
            System.out.println("Not enough fuel! (" + getModel() + ")");
        }
    }

    public void refuel(double amount) {
        currentFuel += amount;
        if (currentFuel > fuelCapacity) {
            currentFuel = fuelCapacity;
        }
        System.out.printf("%s refueled by %.1f L (now %.1f / %.1f L)%n",
                getModel(), amount, currentFuel, fuelCapacity);
    }

    @Override
    public String getInfo() {
        return super.getInfo()
                + String.format(" | Fuel: %.1f / %.1f L", currentFuel, fuelCapacity);
    }

    public double getCurrentFuel() {
        return currentFuel;
    }

    public double getFuelCapacity() {
        return fuelCapacity;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    public double getTrunkVolume() {
        return trunkVolume;
    }

    public void setTrunkVolume(double trunkVolume) {
        this.trunkVolume = trunkVolume;
    }

    public void setFuelCapacity(double fuelCapacity) {
        this.fuelCapacity = fuelCapacity;
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