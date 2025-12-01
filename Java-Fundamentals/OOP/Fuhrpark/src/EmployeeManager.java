import java.util.ArrayList;
import java.util.Scanner;

public class EmployeeManager {
    private final Scanner scanner = new Scanner(System.in);
    private ArrayList<Employee> employeeList = Database.loadEmployees();

    public void createEmployee() {
        System.out.println("\n=== Create new employee ===");
        System.out.print("First name: ");
        String firstName = scanner.nextLine();
        System.out.print("Last name: ");
        String lastName = scanner.nextLine();
        System.out.print("Department: ");
        String branch = scanner.nextLine();
        System.out.print("Position: ");
        String position = scanner.nextLine();
        System.out.print("Email: ");
        String email = scanner.nextLine();

        Employee employee = new Employee(firstName, lastName, branch, position, email);
        Database.saveMitarbeiter(employee);
        employeeList.add(employee);
        System.out.println("Employee added successfully.");
    }

    public void listEmployees() {
        employeeList = Database.loadEmployees();
        System.out.println("\n=== Employee List ===");
        if (employeeList.isEmpty()) {
            System.out.println("No employees found.");
        } else {
            for (Employee employee : employeeList) {
                System.out.println(employee);
            }
        }
    }
}