public class PKW extends Vehicles{
    private int numberOfSeats;
    private double trunkVolume;
    private double fuelCapacity;
    private double consumptionPer100km;

    public PKW(String manufacturer, String model, int year, int numberOfSeats, double trunkVolume){
        super(manufacturer, model, year);
        this.numberOfSeats = numberOfSeats;
        this.trunkVolume = trunkVolume;
        this.fuelCapacity = 50.0;
        this.consumptionPer100km = 7.0;
    }

    @Override
    public void drive(double miles){
        double consumption = (consumptionPer100km / 100) * miles;
        if(fuelCapacity >= consumption){
            fuelCapacity -= consumption;
            super.drive(miles);
        }
        else{
            System.out.println("Not enough fuel!");
        }
    }

    public void refuel(double amount){
        fuelCapacity += amount;
        System.out.println(getModel() + " was refueled by " + amount + "liters");
    }

    public double getFuelCapacity(){
        return fuelCapacity;
    }
}
