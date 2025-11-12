public class Bicycle extends Vehicles {
    private String type;
    private int gears;

    public Bicycle(String manufacturer, String model, int year, String type, int gears) {
        super(manufacturer, model, year);
        this.type = type;
        this.gears = gears;
    }

    @Override
    public void drive(double kilometers) {
        super.drive(kilometers);
        System.out.println(getModel() + " was ridden " + kilometers + " km.");
    }


    public String getType() { return type; }
    public int getGears() { return gears; }

    public void setType(String type) {
        this.type = type;
    }

    public void setGears(int gears) {
        this.gears = gears;
    }

}
