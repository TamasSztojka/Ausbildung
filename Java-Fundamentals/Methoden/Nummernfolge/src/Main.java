import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

class Main {
    void main() {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter number of data values: ");
        int dataLength = scanner.nextInt();

        ArrayList<Integer> data = generateData(dataLength);

        System.out.println("Enter 4 integers for the check sequence");
        ArrayList<Integer> checkSequence = readCheckSequence(scanner, 4);

        printList("\nData transmitted", data);
        printList("Check sequence", checkSequence);

        int index = findSequence(data, checkSequence);

        if (index != -1) {
            System.out.println("Check sequence found at index: " + index);
        }
        else {
            System.out.println("\n Check sequence not found in data transmission.");
        }
    }

    public static ArrayList<Integer> generateData(int dataLength) {
        Random rand = new Random();
        ArrayList<Integer> list = new ArrayList<>();
        for (int i = 0; i < dataLength; i++) {
            list.add(rand.nextInt(10));
        }
        return list;
    }

    public static ArrayList<Integer> readCheckSequence(Scanner scanner, int length) {
        ArrayList<Integer> list = new ArrayList<>();
        for (int i = 0; i < length; i++) {
            list.add(scanner.nextInt());
        }
        return list;
    }

    public static void printList(String label, ArrayList<Integer> list) {
        System.out.println(label + ": " + list);
    }

    public static int findSequence(ArrayList<Integer> data, ArrayList<Integer> sequence){
        for (int i = 0; i <= data.size() - sequence.size(); i++) {
            boolean match = true;
            for (int j = 0; j < sequence.size(); j++) {
                if (!data.get(i + j).equals(sequence.get(j))) {
                    match = false;
                    break;
                }
            }
            if (match) return i;
        }
        return -1;
    }
}
