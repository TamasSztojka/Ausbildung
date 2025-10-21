void main(){
    Scanner scanner = new Scanner(System.in);

    System.out.print("Please enter a color-hex (example: #AABBCC): ");
    String hex = scanner.nextLine();

    if (hex.startsWith("#")) {
        hex = hex.substring(1);
    }

    if (hex.length() != 6) {
        System.out.println("Invalid color-hex format!");
        return;
    }

    String rHex = hex.substring(0, 2);
    String gHex = hex.substring(2, 4);
    String bHex = hex.substring(4, 6);

    int red = Integer.parseInt(rHex, 16);
    int green = Integer.parseInt(gHex, 16);
    int blue = Integer.parseInt(bHex, 16);

    System.out.println("\n--- RGB ---");
    System.out.println("Hex: #" + hex.toUpperCase());
    System.out.println("Rot (R): " + red);
    System.out.println("Grün (G): " + green);
    System.out.println("Blue (B): " + blue);
}
