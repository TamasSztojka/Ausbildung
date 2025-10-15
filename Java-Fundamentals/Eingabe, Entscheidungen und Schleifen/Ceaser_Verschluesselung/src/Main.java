import java.util.Scanner;

public class Main{
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Please enter the sentence you would like to encrypt: ");
        String text = scanner.nextLine();

        System.out.print("Please enter the number by which the sentence should be shifted: ");
        int key = scanner.nextInt();

        String encrypted = encrypt(text, key);

        System.out.println("\n--- Result ---");
        System.out.println("Original:     " + text);
        System.out.println("Key:    " + key);
        System.out.println("Encrpyted: " + encrypted);

        scanner.close();
    }

    private static String encrypt(String text, int key) {
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < text.length(); i++) {
            char character = text.charAt(i);

            if (Character.isUpperCase(character)) {
                char shifted = (char) ('A' + (character - 'A' + key) % 26);
                result.append(shifted);
            } else if (Character.isLowerCase(character)) {
                char shifted = (char) ('a' + (character - 'a' + key) % 26);
                result.append(shifted);
            } else {
                result.append(character);
            }
        }

        return result.toString();
    }
}

