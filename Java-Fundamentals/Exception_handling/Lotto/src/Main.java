import java.util.Arrays;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int[] lottoNumbers = readLottoNumbers();
        System.out.println("Das sind Ihre Lottozahlen: " + Arrays.toString(lottoNumbers));

    }

    public static int[] readLottoNumbers() {
        Scanner scanner = new Scanner(System.in);
        int[] lottoNumbers = new int[6];
        int count = 0;

        while (count < 6) {
            System.out.print("Geben Sie die " + (count + 1) + ". Zahl ein: ");
            String input = scanner.nextLine();

            int number;
            try {
                number = Integer.parseInt(input);
            }
            catch (NumberFormatException e) {
                System.out.println("Das ist keine Zahl. Wiederholen!");
                continue;
            }

            if (number < 1 || number > 45){
                System.out.println("Die Zahl muss zwischen 1 und 45 liegen. Wiederholen!");
                continue;
            }

            boolean duplicate = false;
            for (int i = 0; i < count; i++) {
                if (lottoNumbers[i] == number) {
                    System.out.println("Diese Zahl habe Sie schon. Bitte nochmals eingeben!");
                    duplicate = true;
                    break;
                }
            }

            if (!duplicate) {
                lottoNumbers[count] = number;
                count++;
            }
        }
        Arrays.sort(lottoNumbers);
        return lottoNumbers;
    }
}
