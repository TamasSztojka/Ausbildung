import java.util.Random;

public class Main {
    public static void main(String[] args) {
        int rows = 10;
        int columns = 10;

        int[][] sales = new int[rows][columns];
        Random random = new Random();

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                sales[i][j] = random.nextInt(900) + 100;
            }
        }

        System.out.println("Sales value (Matrix)");
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                System.out.printf("%5d", sales[i][j]);
            }
            System.out.println();
        }

        int min = findMinimum(sales);
        int max = findMaximum(sales);

        System.out.println("\n--- Results ---");
        System.out.println("Smallest sales value: " + min);
        System.out.println("Largest sales value:  " + max);
    }

    public static int findMinimum(int[][] matrix) {
        int min = matrix[0][0];
        for (int[] row : matrix) {
            for (int value : row) {
                if (value < min) {
                    min = value;
                }
            }
        }
        return min;
    }

    public static int findMaximum(int[][] matrix) {
        int max = matrix[0][0];
        for (int[] row : matrix) {
            for (int value : row) {
                if (value > max) {
                    max = value;
                }
            }
        }
        return max;
    }

}
