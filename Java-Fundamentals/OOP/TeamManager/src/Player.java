import java.time.LocalDate;

public class Player extends Member{
    private String position;
    private int number;
    private int goalsScored;

    public Player(int memberID, String firstName, String lastName, LocalDate birthDate, String role, String position, int number, int goalsScored) {
        super(memberID, firstName, lastName, birthDate, role);
        this.position = position;
        this.number = number;
        this.goalsScored = goalsScored;
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
}
