import java.util.ArrayList;
import java.util.List;

public class Club {
    private String name;
    private String address;
    private List<Team> teams;
    private List<Member> members;

    public Club (String name, String address) {
        this.name = name;
        this.address = address;
        this.teams = new ArrayList<>();
        this.members = new ArrayList<>();
    }

    public void addTeam(Team team) {
        teams.add(team);
    }

    public void removeTeam(Team team) {
        teams.remove(team);
    }

    public void addMember(Member member) {
        members.add(member);
    }

    public void removeMember(Member member) {
        members.remove(member);
    }

    public Member getMemberById(int id) {
        for (Member member : members) {
            if (member.getMemberID() == id) return member;
        }
        return null;
    }

    public void printClubInfo(){
        System.out.println("Club: " + name);
        System.out.println("Address: " + address);
        System.out.println("Teams: " + teams.size());
        System.out.println("Members: " + members.size());

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

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }
}
