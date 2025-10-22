import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter sales numbers separated by spaces:");
        String input = scanner.nextLine();

        String[] parts = input.split(" ");
        int[] numbers = new int[parts.length];

        for (int i = 0; i < parts.length; i++) {
            numbers[i] = Integer.parseInt(parts[i]);
        }

        int sum = calculateSum(numbers);

        System.out.println("\n--- Results ---");
        System.out.println("Number of entries: " + numbers.length);
        System.out.println("Sum: " + sum);
    }

    public static int calculateSum(int... values) {
        int sum = 0;
        for (int value : values) {
            sum += value;
        }
        return sum;
    }
}

