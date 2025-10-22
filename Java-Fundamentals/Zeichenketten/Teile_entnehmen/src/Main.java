void main() {
    Scanner scanner = new Scanner(System.in);

    System.out.println("Please enter the Text");
    System.out.println("(z.B. derArtikel[Monitor]wurdebestelltvon[Anna])");
    String text = scanner.nextLine();

    int firstOpen = text.indexOf('[');
    int firstClose = text.indexOf(']');
    int secondOpen = text.lastIndexOf('[');
    int secondClose = text.lastIndexOf(']');

    if (firstOpen == -1 || firstClose == -1 || secondOpen == -1 || secondClose == -1) {
        System.out.println("Error: The entry isn't Valid.");
        return;
    }

    String artikel = text.substring(firstOpen + 1, firstClose);
    String besteller = text.substring(secondOpen + 1, secondClose);

    System.out.println("\n--- Result ---");
    System.out.println("Article: " + artikel);
    System.out.println("Buyer: " + besteller);
}
