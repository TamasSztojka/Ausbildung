import java.util.ArrayList;
import java.util.List;

public class Team {
    private int teamID;
    private String name;
    private Coach coach;
    private List<Member> members;

    public Team(int teamID, String name, Coach coach, List<Member> members) {
        this.teamID = teamID;
        this.name = name;
        this.members = new ArrayList<>();
    }
    public void addMember(Member member) {
        members.add(member);
    }
    public void removeMember(Member member) {
        members.remove(member);
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    public int getMemberCount() {
        return members.size();
    }

    public void printTeamInfo() {
        System.out.println("Team: " + name);
        System.out.println("Coahc: " + (coach != null ? coach.getFullName() : "None"));
        System.out.println("Members: " + members.size());
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Coach getCoach() {
        return coach;
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }
}
