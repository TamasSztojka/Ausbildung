void main(){
    Scanner scanner = new Scanner(System.in);

    System.out.println("Please enter an IPv4 Address (example: 192.168.0.1)");
    String ip = scanner.nextLine();

    String[] parts = ip.split("\\.");

    if (parts.length != 4) {
        System.out.println("Invalid IPv4 Address");
        return;
    }

    System.out.println("\n--- IP-Address ---");
    System.out.println("Decimal\tBinary\tOctal\tHexadecimal");
    System.out.println("--------------");

    for (String part : parts) {
        try{
            int decimal = Integer.parseInt(part);

            if (decimal < 0 || decimal > 255) {
                System.out.println("Invalid Value" + decimal);
                continue;
            }

            String binary = String.format("%8s", Integer.toBinaryString(decimal)).replace(' ', '0');
            String octal = Integer.toOctalString(decimal);
            String hexadecimal = Integer.toHexString(decimal).toUpperCase();

            System.out.printf("%3d\t%s\t%3s\t%2s\n", decimal, binary, octal, hexadecimal);
        }
        catch (NumberFormatException e){
            System.out.println("Invalid Entry" + part);
        }
    }
}
