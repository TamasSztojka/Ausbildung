import java.sql.*;
import java.util.ArrayList;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/vehiclepark";
    private static final String USER = "root";
    private static final String PASSWORD = "Sztojka5728";

    public static Connection connect() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void initialize() {
        String sql = """
            CREATE TABLE IF NOT EXISTS vehicles (
                id INT AUTO_INCREMENT PRIMARY KEY,
                type VARCHAR(50) NOT NULL,
                manufacturer VARCHAR(100) NOT NULL,
                model VARCHAR(100) NOT NULL,
                year INT NOT NULL,
                mileage DOUBLE,
                fuelCurrent DOUBLE,
                fuelCapacity DOUBLE,
                seats INT,
                trunkVolume DOUBLE,
                loadCapacity DOUBLE,
                currentLoad DOUBLE,
                helmetAvailable BOOLEAN,
                gears INT,
                bikeType VARCHAR(50)
            );
        """;

        try (Connection conn = connect();
             Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
            System.out.println("MySQL table ready!");
        } catch (SQLException e) {
            System.out.println("Database initialization failed: " + e.getMessage());
        }
    }

    private static double[] getFuelData(Vehicles v) {
        double currentFuel = 0.0;
        double fuelCapacity = 0.0;

        if (v instanceof Car car) {
            currentFuel = car.getCurrentFuel();
            fuelCapacity = car.getFuelCapacity();
        } else if (v instanceof Truck truck) {
            currentFuel = truck.getCurrentFuel();
            fuelCapacity = truck.getFuelCapacity();
        } else if (v instanceof Bike bike) {
            currentFuel = bike.getCurrentFuel();
            fuelCapacity = bike.getFuelCapacity();
        }

        return new double[]{currentFuel, fuelCapacity};
    }

    public static void saveVehicle(Vehicles v) {
        String sql = """
            INSERT INTO vehicles
            (type, manufacturer, model, year, mileage, fuelCurrent, fuelCapacity)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """;

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            double[] fuelData = getFuelData(v);

            pstmt.setString(1, v.getClass().getSimpleName());
            pstmt.setString(2, v.getManufacturer());
            pstmt.setString(3, v.getModel());
            pstmt.setInt(4, v.getYear());
            pstmt.setDouble(5, v.getMileage());
            pstmt.setDouble(6, fuelData[0]);
            pstmt.setDouble(7, fuelData[1]);

            pstmt.executeUpdate();
            System.out.println("Saved to database: " + v.getModel());
        } catch (SQLException e) {
            System.out.println("Error saving vehicle: " + e.getMessage());
        }
    }

    public static void updateVehicle(Vehicles v) {
        String sql = """
            UPDATE vehicles
            SET mileage = ?, fuelCurrent = ?, fuelCapacity = ?
            WHERE model = ?;
        """;

        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            double[] fuelData = getFuelData(v);

            pstmt.setDouble(1, v.getMileage());
            pstmt.setDouble(2, fuelData[0]);
            pstmt.setDouble(3, fuelData[1]);
            pstmt.setString(4, v.getModel());

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                System.out.println("Updated vehicle in database: " + v.getModel());
            } else {
                System.out.println("No matching vehicle found for update: " + v.getModel());
            }
        } catch (SQLException e) {
            System.out.println("Error updating vehicle: " + e.getMessage());
        }
    }

    public static ArrayList<Vehicles> loadVehicles() {
        ArrayList<Vehicles> list = new ArrayList<>();
        String sql = "SELECT * FROM vehicles";

        try (Connection conn = connect();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String type = rs.getString("type");
                String manufacturer = rs.getString("manufacturer");
                String model = rs.getString("model");
                int year = rs.getInt("year");
                double mileage = rs.getDouble("mileage");
                double fuelCurrent = rs.getDouble("fuelCurrent");
                double fuelCapacity = rs.getDouble("fuelCapacity");

                Vehicles v = switch (type) {
                    case "Car" -> new Car(manufacturer, model, year, 5, 400);
                    case "Truck" -> new Truck(manufacturer, model, year, 12000);
                    case "Bike" -> new Bike(manufacturer, model, year, true);
                    case "Bicycle" -> new Bicycle(manufacturer, model, year, "Citybike", 6);
                    default -> null;
                };

                if (v != null) {
                    v.setMileage(mileage);

                    // Restore actual fuel values from DB
                    if (v instanceof Car car) {
                        car.setCurrentFuel(fuelCurrent);
                        car.setFuelCapacity(fuelCapacity);
                    } else if (v instanceof Truck truck) {
                        truck.setCurrentFuel(fuelCurrent);
                        truck.setFuelCapacity(fuelCapacity);
                    } else if (v instanceof Bike bike) {
                        bike.setCurrentFuel(fuelCurrent);
                        bike.setFuelCapacity(fuelCapacity);
                    }

                    list.add(v);
                }
            }

            System.out.println("Loaded " + list.size() + " vehicles from MySQL.");
        } catch (SQLException e) {
            System.out.println("Error loading vehicles: " + e.getMessage());
        }

        return list;
    }
}