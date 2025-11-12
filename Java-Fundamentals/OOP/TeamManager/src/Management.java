public class Management {
    private Club club;

    public Management(Club club) {
        this.club = club;
    }

    public void displayAllTeams(){
        System.out.println("All Teams in Club:");
        for (Team team : club.getTeams()) {
            System.out.println("- " + team.getName());
        }
    }

    public void displayAllMembers(){
        System.out.println("All Members in Club:");
        for (Member member : club.getMembers()) {
            System.out.println("- " + member.getFullName());
        }
    }

    public Member searchMemberByName(String name){
        for (Member member : club.getMembers()) {
            if (member.getFullName().equals(name)) {
                return member;
            }
        }
        return null;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }
}
