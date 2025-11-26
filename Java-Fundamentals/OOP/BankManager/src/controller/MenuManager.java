package controller;

import model.Account;
import model.Bank;
import view.Validation;

import java.util.Scanner;

public class MenuManager {

    public static void createAccount(Scanner scanner, Bank bank) {
        String owner = Validation.readNonEmptyString(scanner, "Owner name: ");
        Account acc = bank.createAccount(owner);
        System.out.println("Account created: " + acc.getAccountData());
    }

    public static void deleteAccount(Scanner scanner, Bank bank) {
        printAccountsBeforeSelection(bank);

        int number = Validation.readPositiveInt(scanner, "Account number to delete: ");

        if (bank.deleteAccount(number)) {
            System.out.println("Account deleted.");
        } else {
            System.out.println("Account not found.");
        }
    }

    public static void deposit(Scanner scanner, Bank bank) {
        printAccountsBeforeSelection(bank);

        Account acc = readExistingAccount(scanner, bank);
        if (acc == null) return;

        double amount = Validation.readDouble(scanner, "Amount to deposit: ");
        acc.deposit(amount);

        System.out.println("Deposit successful. New balance: " + acc.getBalance());
    }

    public static void withdraw(Scanner scanner, Bank bank) {
        printAccountsBeforeSelection(bank);

        Account acc = readExistingAccount(scanner, bank);
        if (acc == null) return;

        double amount = Validation.readDouble(scanner, "Amount to withdraw: ");

        if (acc.withdraw(amount)) {
            System.out.println("Withdraw successful.");
        } else {
            System.out.println("Insufficient funds.");
        }

        System.out.println("Balance: " + acc.getBalance());

    }

    public static void showAccount(Scanner scanner, Bank bank) {
        Account acc = readExistingAccount(scanner, bank);
        if (acc != null) {
            System.out.println(acc.getAccountData());
        }
    }

    public static void showAllAccounts(Bank bank) {
        if (bank.getAllAccounts().isEmpty()) {
            System.out.println("No accounts found.");
            return;
        }

        for (Account acc : bank.getAllAccounts()) {
            System.out.println(acc.getAccountData());
        }
    }

    private static Account readExistingAccount(Scanner scanner, Bank bank) {
        int number = Validation.readPositiveInt(scanner, "Account number: ");
        Account acc = bank.getAccount(number);

        if (acc == null) {
            System.out.println("Account not found.");
        }

        return acc;
    }

    private static void printAccountsBeforeSelection(Bank bank) {
        System.out.println("--- Available Accounts ---");

        if (bank.getAllAccounts().isEmpty()) {
            System.out.println("No accounts available.");
            return;
        }

        for (Account acc : bank.getAllAccounts()) {
            System.out.println(acc.getAccountData());
        }

        System.out.println("--------------------------");
    }
}
