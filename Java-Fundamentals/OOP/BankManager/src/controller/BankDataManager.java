package controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import model.Bank;
import model.Account;
import model.AccountNumberGenerator;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class BankDataManager {

    private static final String FILE_NAME = "bank.json";

    private static final Gson gson = new GsonBuilder()
            .setPrettyPrinting()
            .create();

    public static void saveBank(Bank bank) {
        try (FileWriter writer = new FileWriter(FILE_NAME)) {
            gson.toJson(bank, writer);
            System.out.println("Bank saved to " + FILE_NAME);
        } catch (IOException e) {
            System.out.println("Error saving bank: " + e.getMessage());
        }
    }

    // Load the bank from JSON
    public static Bank loadBank() {
        try (FileReader reader = new FileReader(FILE_NAME)) {

            Bank bank = gson.fromJson(reader, Bank.class);

            // Restore the account number generator
            int maxNumber = bank.getAllAccounts().stream()
                    .mapToInt(Account::getAccountNumber)
                    .max()
                    .orElse(1000);

            AccountNumberGenerator.getNextNumber();

            return bank;

        } catch (IOException e) {
            System.out.println("No saved bank found — creating new one.");
            return new Bank();
        }
    }
}
