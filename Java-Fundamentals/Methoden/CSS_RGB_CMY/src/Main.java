import java.util.Scanner;

class Main {
    void main(){
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter color mode (rgb or css): ");
        String mode = scanner.nextLine().trim().toLowerCase();

        int r = 0, g = 0, b = 0;

        if (mode.equals("rgb")) {
            System.out.print("Enter R (0-255)");
            r = scanner.nextInt();
            System.out.print("Enter G (0-255)");
            g = scanner.nextInt();
            System.out.print("Enter B (0-255)");
            b = scanner.nextInt();

            if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
                System.out.println("Invalid RGB values! must be between 0 and 255!");
                return;
            }
        }
        else if (mode.equals("css")) {
            System.out.print("Enter CSS color (e. g. #FF8800): ");
            String css = scanner.nextLine().trim();

            if (!css.startsWith("#") || (css.length() != 7)){
                System.out.println("Invalid CSS color format!");
                return;
            }

            r = Integer.parseInt(css.substring(1, 3), 16);
            g = Integer.parseInt(css.substring(3, 5), 16);
            b = Integer.parseInt(css.substring(5, 7), 16);

        }
        else{
            System.out.println("Invalid mode! Please enter 'rgb' or 'css'!");
            return;
        }

        convertAndPrintCMY(r, g, b);
    }
    public static void convertAndPrintCMY(int r, int g, int b){
        double c = (255 - r) / 255.0 * 100;
        double m = (255 - g) / 255.0 * 100;
        double y = (255 - b) / 255.0 * 100;

        System.out.printf("\nRGB: (%d, %d, %d)\n)", r, g, b);
        System.out.printf("CMY: (C = %.2f%%, M = %.2f%%, Y = %.2f%%)\n", c, m, y);
    }
}
