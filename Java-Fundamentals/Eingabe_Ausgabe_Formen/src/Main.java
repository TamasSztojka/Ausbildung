void main(){
    String again;
    boolean continue_while = true;
    int choice;
    double length, width, height, side, radius;
    double base = 0;
    double volume = 0;
    while(continue_while) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("=== Program to calculate base and volume of an object. ===\n");
        System.out.println("Pick the Bodytype");
        System.out.println("1 - Cuboid");
        System.out.println("2 - Three-Sided Prism");
        System.out.println("3 - Zylinder");
        System.out.println("Your Choice: ");
        choice = scanner.nextInt();

        switch (choice) {
            case 1:
                System.out.println("Cuboid");
                System.out.println("The base is a rectangle");
                System.out.println("length: ");
                length = scanner.nextDouble();
                System.out.println("width: ");
                width = scanner.nextDouble();
                System.out.println("height: ");
                height = scanner.nextDouble();

                base = length * width;
                volume = base * height;

                System.out.printf("Base (rectangle): %.2f%n", base);
                System.out.printf("Volume (Quadar): %.2f%n", volume);
                break;

            case 2:
                System.out.println("Three-Sided Prism");
                System.out.println("The base is an equilateral triangle");
                System.out.println("side-length of the triangle: ");
                side = scanner.nextDouble();
                System.out.println("side-length of the triangle: ");
                height = scanner.nextDouble();

                base = (Math.sqrt(3) / 4) * Math.pow(side, 2);
                volume = base * height;

                System.out.printf("Base (triangle): %.2f%n", base);
                System.out.printf("Volume (triangle): %.2f%n", volume);
                break;

            case 3:
                System.out.println("Cylinder");
                System.out.println("The base is a Circle");
                System.out.println("Radius: ");
                radius = scanner.nextDouble();
                System.out.println("Height: ");
                height = scanner.nextDouble();

                base = Math.PI * Math.pow(radius, 2);
                volume = base * height;

                System.out.printf("base (Circle): %.2f%n", base);
                System.out.printf("Volume (Cylinder): %.2f%n", volume);
                break;

            default:
                System.out.println("Invalid choice. Please only enter the numbers 1-3.");
                break;
        }
        // === Ask if user wants to continue ===
        System.out.print("\nWould you like to try again? (y/n): ");
        again = scanner.next(); // read as word (not nextLine)
        if (!again.trim().equalsIgnoreCase("y")) {
            continue_while = false;
        }
    }
    System.out.print("Goodbye!");
}
