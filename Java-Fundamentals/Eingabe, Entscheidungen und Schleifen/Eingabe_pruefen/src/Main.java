void main(){
    Scanner scanner = new Scanner(System.in);
    String description = "";
    int amount = 0;
    double price = 0.0;
    boolean validDescription = false;
    boolean validAmount = false;
    boolean validPrice = false;

    while(!validDescription){
        System.out.print("Please enter a description: ");
        description = scanner.nextLine();

        if(description.matches("[A-Za-z0-9äöüÄÖÜß\\\\s\\\\-_.:,;!?/()]+")){
            validDescription = true;
        }
        else{
            System.out.println("Invalid description! only letters, numbers, and some special characters allowed!");
        }
    }

    while(!validAmount){
        System.out.print("Please enter an amount: ");
        String entry = scanner.nextLine();

        if (entry.matches("\\d+")){
            amount = Integer.parseInt(entry);
            validAmount = true;
        }
        else{
            System.out.println("Please only enter whole numbers!");
        }
    }
    while(!validPrice){
        System.out.print("Please enter a price: ");
        String entry = scanner.nextLine();

        if (entry.matches("\\d+[.]\\d+")){
            price = Double.parseDouble(entry);
            validPrice = true;
        }
        else{
            System.out.println("Please enter a valid decimal number!");
        }
    }
    System.out.println("\n Entrys are valid:");
    System.out.println("Description: " + description);
    System.out.println("Amount: " + amount);
    System.out.println("Price: " + price);
}
