void main() {
    Scanner scanner = new Scanner(System.in);
    int year = 0;
    int start = 0;
    int end = 0;
    boolean found = false;

    IO.println("Please enter a year");
    year = scanner.nextInt();

    if (isLeapYear(year)) {
        System.out.println("The Year " + year + " is a leap year");
    } else {
        System.out.println("The Year " + year + " is not a leap year");
    }

    System.out.println("\nPlease enter the starting year");
    start = scanner.nextInt();

    System.out.println("Enter the ending year");
    end = scanner.nextInt();

    System.out.println("\n Leap year between " + start + "and " + end + ":");

    for (int i = start; i <= end; i++) {
        if (isLeapYear(i)) {
            System.out.print(i + " ");
            found = true;
        }
    }
    if (!found) {
        System.out.println("No leap year found between " + start + " and " + end);
    }
}

public static boolean isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}



