import java.util.ArrayList;
import java.util.List;

public class Club {
    private String name;
    private String address;
    private ArrayList<Member> members = new ArrayList<>();
    private ArrayList<Team> teams = new ArrayList<>();

    public Club (String name, String address) {
        this.name = name;
        this.address = address;
    }

    public void addMember(Member member){
        members.add(member);
    }

    public void addTeam(Team team){
        teams.add(team);
    }

    public void printClubInfo(){
        System.out.println("Club: " + name);
        System.out.println("Address: " + address);
        System.out.println("Teams: " + teams.size());
        System.out.println("Members: " + members.size());

    }

    public ArrayList<Member> getMembers(){
        return members;
    }

    public ArrayList<Team> getTeams(){
        return teams;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
