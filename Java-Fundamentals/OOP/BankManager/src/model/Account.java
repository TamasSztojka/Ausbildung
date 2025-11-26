package model;

public class Account {

    private int accountNumber;
    private String owner;
    private double balance;

    public Account(String owner) {
        //this.accountNumber = accountNumber;
        this.accountNumber = AccountNumberGenerator.getNextNumber();
        this.owner = owner;
        this.balance = 0.0;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    public String getOwner() {
        return owner;
    }

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public boolean withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            return true;
        }
        return false;
    }

    public void setAccountNumber(int accountNumber) {
        this.accountNumber = accountNumber;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAccountData() {
        return "Account #" + accountNumber +
                " | Owner: " + owner +
                " | Balance: " + balance + " EUR";
    }
}
