import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int vowels = 0;
        int consonants = 0;
        int punctuation = 0;
        int space = 0;

        System.out.println("Please enter a text:");
        String text = scanner.nextLine();

        char[] vowelsList = {'a','e','i','o','u', 'A','E','I','O','U'};
        char[] punctuationList = {'.', ',', '!', '?', ';', ':', '-', '–', '„', '“', '"'};

        for (int i = 0; i < text.length(); i++) {
            char character = text.charAt(i);

            if (Character.isLetter(character)) {
                if(isVowel(character, vowelsList)){
                    vowels++;
                }
                else{
                    consonants++;
                }
            }
            else if (Character.isWhitespace(character)){
                space++;
            }
            else if (isPunctuation(character, punctuationList)){
                punctuation++;
            }
        }
        int total = text.length();

        System.out.println("\n--- Text Analysis ---");
        System.out.println("Total characters: " + total);
        System.out.println("Vowels: " + vowels);
        System.out.println("Consonants: " + consonants);
        System.out.println("Spaces: " + space);
        System.out.println("Punctuation marks: " + punctuation);
    }
    private static boolean isVowel(char character, char[] vowelList){
        for (char vowel : vowelList) {
            if (character == vowel) return true;
        }
        return false;
    }

    private static boolean isPunctuation(char character, char[] punctuationList){
        for (char punctuation : punctuationList) {
            if (character == punctuation) return true;
        }
        return false;
    }
}




