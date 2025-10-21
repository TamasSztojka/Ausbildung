void main() {
    Scanner scanner = new Scanner(System.in);
    Random random = new Random();

    System.out.print("How many numbers would you like to draw?: ");
    int numberOfDraws = scanner.nextInt();

    ArrayList<Integer> allNumbers = new ArrayList<>();

    for (int i = 0; i < numberOfDraws; i++) {
        int[] draws = new int[6];
        System.out.print("Draws " + (i + 1) + ": ");

        for (int j = 0; j < 6; j++) {
            int number = random.nextInt(45) + 1;
            draws[j] = number;
            allNumbers.add(number);
            System.out.print(number + " ");
        }
        System.out.println();
    }

    int[] frequenzy = new int[46];
    for (int number : allNumbers) {
        frequenzy[number]++;
    }

    int total = allNumbers.size();
    System.out.println("\n--- Lotto-Results ---");
    System.out.println("Total number of draws: " + numberOfDraws);
    System.out.println("Total numbers: " + total + "\n");

    System.out.println("Number\tAmount\tPercent");
    for (int i = 1; i <= 45; i++) {
        double percent = (double) frequenzy[i] / total * 100;
        System.out.printf("%2d\t%5d\t%6.2f%%\n", i, frequenzy[i], percent);
    }
}

