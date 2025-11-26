package model;

public class AccountNumberGenerator {

    private static int last = 1000;

    public static int getNextNumber() {
        return ++last;
    }
}
