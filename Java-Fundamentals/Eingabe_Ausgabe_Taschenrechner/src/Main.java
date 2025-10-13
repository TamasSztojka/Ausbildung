//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
void main() {
    while(true) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Please enter the first number:");
        int firstNumber = sc.nextInt();

        System.out.println("Please enter the second number:");
        int secondNumber = sc.nextInt();

        String operator;
        while(true) {
            System.out.println("How do you want to calculate today(+, -, *, /)");
            operator = sc.next();

            if(operator.equals("+") || (operator.equals("-") || operator.equals("*") || operator.equals("/"))) {
                break;
            }
            else {
                System.out.println("Not a valid operator. Please try again.(+, -, *, /)");
                System.out.println();
            }
        }

        switch (operator) {
            case "+" -> System.out.println("Result: " + (firstNumber + secondNumber));
            case "-" -> System.out.println("Result: " + (firstNumber - secondNumber));
            case "*" -> System.out.println("Result: " + (firstNumber * secondNumber));
            case "/" -> System.out.println("Result: " + (firstNumber / secondNumber));
            default -> System.out.println("Invalid operator. Please enter a valid operator. (+, -, *, /)");
        }

        while(true) {
            System.out.println("Do you want to perform another calculation?(yes/no)");
            String choice = sc.next();

            if (choice.equalsIgnoreCase("no")) {
                System.out.println("Goodbye");
                return;
            }
            else if (choice.equalsIgnoreCase("yes")) {
                break;
            }
            else {
                System.out.println("Invalid choice. Please try again.");
                System.out.println();
            }

            System.out.println();
        }

    }
}
