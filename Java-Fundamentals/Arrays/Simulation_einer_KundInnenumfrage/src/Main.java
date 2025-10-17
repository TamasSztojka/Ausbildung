import java.util.Random;

public static void main() {
    Scanner scanner = new Scanner(System.in);
    Random random = new Random();

    System.out.println("Please enter the number of people taking part: ");
    int numberOfPeople = scanner.nextInt();

    int[] evaluation = new int[numberOfPeople];

    int bad = 0;
    int ok = 0;
    int good = 0;

    for (int i = 0; i < numberOfPeople; i++) {
        evaluation[i] = random.nextInt(3) +1;
    }

    for (int eval : evaluation ){
        switch (eval){
            case 1 -> bad++;
            case 2 -> ok++;
            case 3 -> good++;
        }
    }

    double percentBad = (double) bad / numberOfPeople * 100;
    double percentOk = (double) ok / numberOfPeople * 100;
    double percentGood = (double) good / numberOfPeople * 100;

    double average = (1.0 * bad + 2.0 * ok + 3.0 * good) / numberOfPeople;

    System.out.println("\n--- Result ---");
    System.out.println("Number of People: " + numberOfPeople);
    System.out.println("1 = Not recommended : " + bad + " (" + String.format("%.1f", percentBad) + "%)");
    System.out.println("2 = ok          : " + ok + " (" + String.format("%.1f", percentOk) + "%)");
    System.out.println("3 = good        : " + good + " (" + String.format("%.1f", percentGood) + "%)");
    System.out.println("------------------------------------------");
    System.out.println("Total evaluation (1–3): " + String.format("%.2f", average));
}
