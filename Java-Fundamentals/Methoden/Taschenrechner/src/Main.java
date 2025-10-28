import java.util.Scanner;

class Main {
    public static void main(String[] args){
        while(true){
            Scanner scanner = new Scanner(System.in);

            System.out.print("Enter first number: ");
            String firstInput = scanner.nextLine();

            System.out.print("Enter operation (+, -, *, /): ");
            char operator = scanner.nextLine().charAt(0);

            System.out.print("Enter second number: ");
            String secondInput = scanner.nextLine();

            if (firstInput.contains(".") || secondInput.contains(".")) {
                double first = Double.parseDouble(firstInput);
                double second = Double.parseDouble(secondInput);
                double result = calculate(first, second, operator);
                System.out.printf("Result: %.2f\n", result);
            }
            else{
                int first = Integer.parseInt(firstInput);
                int second = Integer.parseInt(secondInput);
                int result = calculate(first, second, operator);
                System.out.println("Result: " + result);
            }
            while(true){
                System.out.println("Do you want to continue (y/n): ");
                String continueInput = scanner.nextLine();

                if (continueInput.equalsIgnoreCase("y")) {
                    break ;
                }
                else if (continueInput.equalsIgnoreCase("n")){
                    return;
                }
                else{
                    System.out.println("Invalid input");
                }
            }
        }
    }

    public static int calculate(int a, int b, char operator) {
        return (int) performOperation(a, b, operator);
    }

    public static double calculate(double a, double b, char operator) {
        return performOperation(a, b, operator);
    }

    private static double performOperation(double a, double b, char operator) {
        return switch (operator) {
            case '+' -> a + b;
            case '-' -> a - b;
            case '*' -> a * b;
            case '/' -> {
                if (b == 0) {
                    System.out.println("Error: Division by zero is not allowed!");
                    yield 0;
                } else {
                    yield a / b;
                }
            }
            default -> {
                System.out.println("Invalid operator!");
                yield 0;
            }
        };
    }
}
