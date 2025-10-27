import java.util.Scanner;

class Main {
    void main(){
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
    }

    public static int calculate(int first, int second, char operator){
        return switch (operator) {
            case '+' -> (first + second);
            case '-' -> (first - second);
            case '*' -> (first * second);
            case '/' -> (first / second);
            default -> {
                System.out.println("Invalid operator!");
                yield 0;
            }
        };
    }

    public static double calculate(double first, double second, char operator){
        return switch (operator) {
            case '+' -> (first + second);
            case '-' -> (first - second);
            case '*' -> (first * second);
            case '/' -> (first / second);
            default -> {
                System.out.println("Invalid operator!");
                yield 0;
            }
        };
    }
}
