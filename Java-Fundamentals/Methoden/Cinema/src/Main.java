import java.util.ArrayList;
import java.util.Random;

class Main{
    void main(){
        int rows = 5;
        int seatsPerRow = 6;

        ArrayList<ArrayList<Integer>> cinema = createCinema(rows, seatsPerRow);
        printCinema(cinema);
        printFreeSeats(cinema);
        printOccupancy(cinema);
    }

    public static ArrayList<ArrayList<Integer>> createCinema(int rows, int seatsPerRow){
        Random random = new Random();
        ArrayList<ArrayList<Integer>> cinema = new ArrayList<>();
        for (int i = 0; i < rows; i++){
            ArrayList<Integer> row = new ArrayList<>();
            for (int j = 0; j < seatsPerRow; j++){
                row.add(random.nextBoolean() ? 1 : 0);
            }
            cinema.add(row);
        }
        return cinema;
    }

    public static void printCinema(ArrayList<ArrayList<Integer>> cinema){
        System.out.println("Cinema layout (1 = occupied, 0 = free):");
        for (ArrayList<Integer> row : cinema){
            for (int seat : row) System.out.print(seat + " ");
            System.out.println();
        }
        System.out.println();
    }

    public static void printFreeSeats(ArrayList<ArrayList<Integer>> cinema){
        for (int i = 0; i < cinema.size(); i++){
            int free = 0;
            for (int seat : cinema.get(i)) if (seat == 0) free++;{
                System.out.println(free + " free seats in row " + (i + 1));
            }
        }
        System.out.println();
    }

    public static void printOccupancy(ArrayList<ArrayList<Integer>> cinema){
        int total = 0, occupied = 0;
        for (ArrayList<Integer> row : cinema){
            for (int seat : row){
                total++;
                if (seat == 1) occupied++;
            }
        }
        double percent = (double) occupied / total * 100;
        System.out.printf("Occupancy: %.1f%%\n", percent);
    }

}
