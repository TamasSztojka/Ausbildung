

void main(){
    Scanner scanner = new Scanner(System.in);
    double lowerLimit = 0;
    double upperLimit = 0;
    double difference = 0;
    double steps = 0;


    System.out.print("Lower limit for the article price: ");
    lowerLimit = scanner.nextDouble();
    System.out.print("Upper limit for the article price: ");
    upperLimit = scanner.nextDouble();

    difference = upperLimit - lowerLimit;
    steps = difference / 10;

    System.out.println("\nPrice-table (article price and total price):");
    for (int i = 0; i <= 10; i++){
        double articlePrice = lowerLimit + i * steps;
        System.out.printf("%.2f\t", articlePrice);
    }
    System.out.println();

    for (int amount = 10; amount <= 100; amount += 10){
        System.out.print(amount + "\t");
        for (int i = 0; i <= 10; i++){
            double articlePrice = lowerLimit + i * steps;
            double totalPrice = amount * articlePrice;
            System.out.printf("%.2f\t", totalPrice);
        }
        System.out.println();
    }
}
