package model;

public class AccountNumberGenerator {

    private static int last = 1000;

    public static int getNextNumber() {
        return ++last;
    }

    public static int getLast() {
        return last;
    }

    public static void setLast(int last) {
        AccountNumberGenerator.last = last;
    }
}
