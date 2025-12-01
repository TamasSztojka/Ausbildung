import java.sql.*;
import java.util.ArrayList;

public class Database {

    // ====== Database connection variables ======
    private static final String URL = "jdbc:mysql://localhost:3306/vehiclepark";
    private static final String USER = "root";                // your MySQL username
    private static final String PASSWORD = "Sztojka5728";   // your MySQL password

    public static Connection connect() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void initialize() {
        String sql = """
            CREATE TABLE IF NOT EXISTS vehicles (
                id INT AUTO_INCREMENT PRIMARY KEY,
                type VARCHAR(50) NOT NULL,
                manufacturer VARCHAR(100) NOT NULL,
                model VARCHAR(100) NOT NULL UNIQUE,
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

        String sqlEmployee = """
                CREATE TABLE IF NOT EXISTS employee (
                id INT AUTO_INCREMENT PRIMARY KEY,
                firstName VARCHAR(100) NOT NULL,
                lastName VARCHAR(100) NOT NULL,
                branch VARCHAR(100),
                position VARCHAR(100),
                email VARCHAR(150)
            );
        """;

        try (Connection conn = connect(); Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
            stmt.execute(sqlEmployee);
            System.out.println("MySQL tables ready!");
        } catch (SQLException e) {
            System.out.println("Database initialization failed: " + e.getMessage());
        }
    }

    private static double[] getFuelData(Vehicles vehicle) {
        double currentFuel = 0.0;
        double fuelCapacity = 0.0;

        if (vehicle instanceof Car car) {
            currentFuel = car.getCurrentFuel();
            fuelCapacity = car.getFuelCapacity();
        } else if (vehicle instanceof Truck truck) {
            currentFuel = truck.getCurrentFuel();
            fuelCapacity = truck.getFuelCapacity();
        } else if (vehicle instanceof Bike bike) {
            currentFuel = bike.getCurrentFuel();
            fuelCapacity = bike.getFuelCapacity();
        }
        return new double[]{currentFuel, fuelCapacity};
    }

    private static Object[] getSpecificData(Vehicles vehicle) {
        int seats = 0;
        int gears = 0;
        double trunkVolume = 0.0;
        double loadCapacity = 0.0;
        double currentLoad = 0.0;
        boolean helmetAvailable = false;
        String bikeType = null;

        if (vehicle instanceof Car car) {
            seats = car.getNumberOfSeats();
            trunkVolume = car.getTrunkVolume();
        } else if (vehicle instanceof Truck truck) {
            loadCapacity = truck.getLoadCapacity();
            currentLoad = truck.getCurrentLoad();
        } else if (vehicle instanceof Bike bike) {
            helmetAvailable = bike.isHelmetAvailable();
        } else if (vehicle instanceof Bicycle bicycle) {
            gears = bicycle.getGears();
            bikeType = bicycle.getType();
        }

        return new Object[]{seats, trunkVolume, loadCapacity, currentLoad, helmetAvailable, gears, bikeType};
    }

    private static void applyFuelData(Vehicles vehicle, double fuelCurrent, double fuelCapacity) {
        if (vehicle instanceof Car car) {
            car.setCurrentFuel(fuelCurrent);
            car.setFuelCapacity(fuelCapacity);
        } else if (vehicle instanceof Truck truck) {
            truck.setCurrentFuel(fuelCurrent);
            truck.setFuelCapacity(fuelCapacity);
        } else if (vehicle instanceof Bike bike) {
            bike.setCurrentFuel(fuelCurrent);
            bike.setFuelCapacity(fuelCapacity);
        }
    }

    public static void saveVehicle(Vehicles vehicle) {
        String sql = """
            INSERT INTO vehicles
            (type, manufacturer, model, year, mileage,
             fuelCurrent, fuelCapacity, seats, trunkVolume,
             loadCapacity, currentLoad, helmetAvailable, gears, bikeType)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        """;

        try (Connection connection = connect(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            double[] fuel = getFuelData(vehicle);
            Object[] data = getSpecificData(vehicle);

            preparedStatement.setString(1, vehicle.getClass().getSimpleName());
            preparedStatement.setString(2, vehicle.getManufacturer());
            preparedStatement.setString(3, vehicle.getModel());
            preparedStatement.setInt(4, vehicle.getYear());
            preparedStatement.setDouble(5, vehicle.getMileage());
            preparedStatement.setDouble(6, fuel[0]);
            preparedStatement.setDouble(7, fuel[1]);
            preparedStatement.setInt(8, (int) data[0]);
            preparedStatement.setDouble(9, (double) data[1]);
            preparedStatement.setDouble(10, (double) data[2]);
            preparedStatement.setDouble(11, (double) data[3]);
            preparedStatement.setBoolean(12, (boolean) data[4]);
            preparedStatement.setInt(13, (int) data[5]);
            preparedStatement.setString(14, (String) data[6]);

            preparedStatement.executeUpdate();
            System.out.println("Saved to database: " + vehicle.getModel());

        } catch (SQLException e) {
            System.out.println("Error saving vehicle: " + e.getMessage());
        }
    }

    public static void updateVehicle(Vehicles vehicle) {
        String sql = """
            UPDATE vehicles SET
                mileage=?, fuelCurrent=?, fuelCapacity=?,
                seats=?, trunkVolume=?, loadCapacity=?, currentLoad=?,
                helmetAvailable=?, gears=?, bikeType=?
            WHERE model=?;
        """;

        try (Connection conn = connect(); PreparedStatement ps = conn.prepareStatement(sql)) {
            double[] fuel = getFuelData(vehicle);
            Object[] data = getSpecificData(vehicle);

            ps.setDouble(1, vehicle.getMileage());
            ps.setDouble(2, fuel[0]);
            ps.setDouble(3, fuel[1]);
            ps.setInt(4, (int) data[0]);
            ps.setDouble(5, (double) data[1]);
            ps.setDouble(6, (double) data[2]);
            ps.setDouble(7, (double) data[3]);
            ps.setBoolean(8, (boolean) data[4]);
            ps.setInt(9, (int) data[5]);
            ps.setString(10, (String) data[6]);
            ps.setString(11, vehicle.getModel());

            int rows = ps.executeUpdate();
            if (rows > 0)
                System.out.println("Updated vehicle: " + vehicle.getModel());
            else
                System.out.println("No matching vehicle found for update: " + vehicle.getModel());

        } catch (SQLException e) {
            System.out.println("Error updating vehicle: " + e.getMessage());
        }
    }

    public static ArrayList<Vehicles> loadVehicles() {
        ArrayList<Vehicles> list = new ArrayList<>();
        String sql = "SELECT * FROM vehicles";

        try (Connection conn = connect();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                String type = resultSet.getString("type");
                String manufacturer = resultSet.getString("manufacturer");
                String model = resultSet.getString("model");
                int year = resultSet.getInt("year");
                double mileage = resultSet.getDouble("mileage");
                double fuelCurrent = resultSet.getDouble("fuelCurrent");
                double fuelCapacity = resultSet.getDouble("fuelCapacity");

                Vehicles v = switch (type) {
                    case "Car" -> new Car(manufacturer, model, year,
                            resultSet.getInt("seats"), resultSet.getDouble("trunkVolume"));
                    case "Truck" -> {
                        Truck t = new Truck(manufacturer, model, year, resultSet.getDouble("loadCapacity"));
                        t.setCurrentLoad(resultSet.getDouble("currentLoad"));
                        yield t;
                    }
                    case "Bike" -> new Bike(manufacturer, model, year, resultSet.getBoolean("helmetAvailable"));
                    case "Bicycle" -> new Bicycle(manufacturer, model, year,
                            resultSet.getString("bikeType"), resultSet.getInt("gears"));
                    default -> null;
                };

                if (v != null) {
                    v.setMileage(mileage);
                    applyFuelData(v, fuelCurrent, fuelCapacity);
                    list.add(v);
                }
            }

            System.out.println("Loaded " + list.size() + " vehicles from database.");

        } catch (SQLException e) {
            System.out.println("Error loading vehicles: " + e.getMessage());
        }

        return list;
    }

    // Save employee
    public static void saveMitarbeiter(Employee employee) {
        String sql = "INSERT INTO employee (firstName, lastName, branch, position, email) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = connect(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, employee.getFirstName());
            ps.setString(2, employee.getLastName());
            ps.setString(3, employee.getBranch());
            ps.setString(4, employee.getPosition());
            ps.setString(5, employee.getEmail());
            ps.executeUpdate();
            System.out.println("Saved Employee: " + employee.getFullName());
        } catch (SQLException e) {
            System.out.println("Error saving Employee: " + e.getMessage());
        }
    }

    public static ArrayList<Employee> loadEmployees() {
        ArrayList<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee";

        try (Connection conn = connect(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("branch"),
                        rs.getString("position"),
                        rs.getString("email")
                );
                list.add(employee);
            }
        } catch (SQLException e) {
            System.out.println("Error loading Mitarbeiter: " + e.getMessage());
        }

        return list;
    }
}