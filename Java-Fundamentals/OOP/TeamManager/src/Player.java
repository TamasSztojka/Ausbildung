import java.time.LocalDate;

public class Player extends Member{
    private static int nextPlayerID = 1;
    private String position;
    private int number;
    private int goalsScored;

    public Player(String firstName, String lastName, LocalDate birthDate,
                  String position, int number) {

        super(nextPlayerID++, firstName, lastName, birthDate, "Player");

        this.position = position;
        this.number = number;
        this.goalsScored = 0;
    }

    public void updateGoals(int goals){
        this.goalsScored += goals;
    }

    public void printPlayerStats() {
        System.out.println(getFullName() + " (#" + number + ", " + position + ") - Goals: " + goalsScored);
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getGoalsScored() {
        return goalsScored;
    }

    public void setGoalsScored(int goalsScored) {
        this.goalsScored = goalsScored;
    }

    @Override
    public String toString() {
        return "Player → ID: " + getMemberID() +
                ", Name: " + getFullName() +
                ", Position: " + position +
                ", Number: " + number +
                ", Goals: " + goalsScored;
    }
}
