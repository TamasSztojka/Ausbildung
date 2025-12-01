using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LE_02_03_Benutzer_Anlegen
{
    internal class Program
    {
        static List<Dictionary<string, string>> users = new List<Dictionary<string, string>>();
        static void Main(string[] args)
        {

            bool quit = false;

            while (!quit)
            {
                Console.WriteLine("=== User Management Menu ===");
                Console.WriteLine("1. Create User");
                Console.WriteLine("2. Filter user by age");
                Console.WriteLine("3. View all Users");
                Console.WriteLine("4. Exit Program");

                int choice = Convert.ToInt32(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        CreateUser();
                        break;
                    case 2:
                        FilterUser();
                        break;
                    case 3:
                        ViewAllUsers();
                        break;
                    case 4:
                        quit = true;
                        break;
                    default:
                        Console.WriteLine("Please only enter the numbers 1-4");
                        break;

                }
            }
        }
        static void CreateUser()
        {
            string firstName = UsernameValidation("Please enter the first name:");
            string lastName = UsernameValidation("Please enter the last name:");
            int age = AgeValidation("Please enter the users age:");
            string phone = PhoneNumberValidation("Please enter the phone number");

            users.Add(new Dictionary<string, string>
            {
                ["FirstName"] = firstName,
                ["LastName"] = lastName,
                ["Age"] = age.ToString(),
                ["Phone"] = phone
            });

            Console.WriteLine("User created successfully");
        }

        static void FilterUser()
        {
            int targetAge = AgeValidation("Enter age to filter:");

            var filtered = users
                .Where(u => int.Parse(u["Age"]) == targetAge)
                .ToList();

            if (filtered.Count == 0)
            {
                Console.WriteLine($"No users found with age {targetAge}.");
                return;
            }

            Console.WriteLine($"Users with age {targetAge}:");
            foreach (var user in filtered)
            {
                Console.WriteLine($"{user["FirstName"]} {user["LastName"]}, Phone: {user["Phone"]}");
            }
        }

        static void ViewAllUsers()
        {
            if (users.Count == 0)
            {
                Console.WriteLine("No users found");
                return;
            }

            foreach (var user in users)
            {
                Console.WriteLine($"{user["FirstName"]} {user["LastName"]}, Age: {user["Age"]}, Phone: {user["Phone"]}");
            }
        }

        static string UsernameValidation(string message)
        {
            while (true)
            {
                Console.WriteLine(message);
                string input = Console.ReadLine();

                if (!string.IsNullOrWhiteSpace(input) && input.All(char.IsLetter))
                    return input;

                Console.WriteLine("Name must contain only letters");
            }
        }

        static int AgeValidation(string message)
        {
            while (true)
            {
                Console.WriteLine(message);
                string input = Console.ReadLine();

                if (int.TryParse(input, out int age) && age > 0 && age <= 120)
                    return age;

                Console.WriteLine("Age must be a valid number between 1-120.");
            }
        }

        static string PhoneNumberValidation(string message)
        {
            while (true)
            {
                Console.WriteLine(message);
                string input = Console.ReadLine();

                if (input.All(char.IsDigit) && input.Length >= 7 && input.Length <= 15)
                    return input;

                Console.WriteLine("Phone number must be 7-15 digits.");
            }
        }
    }
}
