void main(){
    Scanner scanner = new Scanner(System.in);

    int start = 0;
    int end = 0;
    int steps = 0;
    boolean valid = false;

    while (!valid){
        System.out.println("Please enter the starting number!");
        if (scanner.hasNextInt()){
            start = scanner.nextInt();
            valid = true;
        }
        else {
            System.out.println("The number has to be a whole number!");
            scanner.next();
        }
    }
    valid = false;
    while (!valid){
        System.out.println("Please enter the ending number!");
        if (scanner.hasNextInt()){
            end = scanner.nextInt();
            valid = true;
        }
        else {
            System.out.println("The number has to be a whole number!");
            scanner.next();
        }
    }
    valid = false;
    while (!valid){
        System.out.println("Please enter the step in which the numbers increase!");
        if (scanner.hasNextInt()){
            steps = scanner.nextInt();
            valid = true;
        }
        else {
            System.out.println("The number has to be a whole number!");
            scanner.next();
        }
    }
    System.out.println("\n Number-list:");
    for (int i = start; i <= end; i += steps){
        System.out.print(i + " ");
    }

    System.out.println();

}
