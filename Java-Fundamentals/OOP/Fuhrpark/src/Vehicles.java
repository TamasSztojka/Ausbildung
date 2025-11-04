public class Vehicles {
    private String manufacturer;
    private String model;
    private int year;
    private double mileage;
    private boolean isDriveReady;

    public static int numberOfVehicles;

    public Vehicles(String manufacturer, String model, int year) {
        this.manufacturer = manufacturer;
        this.model = model;
        this.year = year;
        this.mileage = 0.0;
        this.isDriveReady = true;
        numberOfVehicles++;
    }

    public void drive(double miles){
        if (isDriveReady){
            mileage += miles;
            System.out.println(model + " is driving " + mileage + " miles");
        }
        else{
            System.out.println(model + " is not drive ready!");
        }
    }

    public void repairs(){
        isDriveReady = true;
        System.out.println(model + " was repaired successfully and is drivable again!");
    }

    public String getInfo(){
        return manufacturer + " " + model + " " + year + " " + mileage +" km";
    }
    public String getManufacturer() {return manufacturer;}
    public void setManufacturer(String manufacturer) {this.manufacturer = manufacturer;}

    public String getModel() {return model;}
    public void setModel(String model) {this.model = model;}

    public int getYear() {return year;}
    public void setYear(int year) {this.year = year;}

    public double getMileage() {return mileage;}
    public void setMileage(double mileage) {this.mileage = mileage;}

    public boolean isDriveReady() {return isDriveReady;}
    public void setDriveReady(boolean isDriveReady) {this.isDriveReady = isDriveReady;}

    public static int getNumberOfVehicles() {return numberOfVehicles;}
}
