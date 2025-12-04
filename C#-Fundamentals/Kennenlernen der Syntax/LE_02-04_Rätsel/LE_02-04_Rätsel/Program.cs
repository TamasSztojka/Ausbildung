using System;
using System.IO;
using System.Text.Json;
using System.Threading.Tasks;

namespace LE_02_04_Rätsel
{
    internal class Program
    {
        static int points = 0;
        static void Main(string[] args)
        {
            Boolean quit = false;

            while (!quit)
            {
                Console.WriteLine("=== Welcome to Puzzly! Please solve the puzzles to earn points! === \n");
                Console.WriteLine("1. Mathematic puzzles");
                Console.WriteLine("2. Logical puzzles");
                Console.WriteLine("3. Exit");

                int choice = Convert.ToInt32(Console.ReadLine());

                Console.Clear();

                switch (choice)
                {
                    case 1:
                        MathematicPuzzles();
                        break;
                    case 2:
                        LogicalPuzzles();
                        break;
                    case 3:
                        quit = true;
                        break;
                    default:
                        Console.WriteLine("Please only enter the numbers 1 to 3");
                        break;
                }

                Console.WriteLine($"Final point total: {points}");
            }
        }

        static void MathematicPuzzles()
        {
            bool repeat = true;

            while (repeat)
            {
                Random random = new Random();

                int randomNumber1 = random.Next(1, 101);
                int randomNumber2 = random.Next(1, 101);

                string[] operators = { "+", "-", "*", "/" };
                string op = operators[random.Next(operators.Length)];

                double result = 0;

                switch (op)
                {
                    case "+":
                        result = randomNumber1 + randomNumber2;
                        break;
                    case "-":
                        result = randomNumber1 - randomNumber2;
                        break;
                    case "*":
                        result = randomNumber1 * randomNumber2;
                        break;
                    case "/":
                        result = (double)randomNumber1 / randomNumber2;
                        break;
                    default:
                        Console.WriteLine("Something went wrong!");
                        break;
                }

                Console.WriteLine($"{randomNumber1} {op} {randomNumber2} = ?");
                double answer = ValidateNumber("Please enter your answer!");

                double rounded = Math.Round(result, 2);

                Console.WriteLine($"result: {rounded}");

                if (answer == rounded)
                {
                    points++;
                    Console.WriteLine("Correct, good job!");
                }

                else
                {
                    Console.WriteLine("Incorrect!");
                }

                Console.WriteLine($"Current Points: {points}\n");

                Console.WriteLine("\nWould you like to try another math puzzle? (y/n)");
                string retry = Console.ReadLine().ToLower();

                if (retry != "y")
                    repeat = false;

                Console.Clear();

            }
        }
        static void LogicalPuzzles()
        {
            string path = "logic_puzzles.json";
            if (!File.Exists(path))
            {
                Console.WriteLine("logic_puzzles.json not found!");
                return;
            }

            string json = File.ReadAllText(path);

            JsonDocument doc = JsonDocument.Parse(json);
            JsonElement root = doc.RootElement.GetProperty("logicPuzzles");

            int count = root.GetArrayLength();

            Random rnd = new Random();
            int index = rnd.Next(count);

            JsonElement puzzle = root[index];

            string question = puzzle.GetProperty("question").GetString();
            string answer = puzzle.GetProperty("answer").GetString();

            Console.WriteLine("Solve this puzzle:\n" + question);
            string userInput = Console.ReadLine().Trim().ToLower();

            if (userInput == answer.ToLower())
            {
                points++;
                Console.WriteLine("Correct!");
            }

            else
            {
                Console.WriteLine($"Wront! The correct answer was: {answer}");
            }

            Console.WriteLine($"\nCurrent points: {points}\n");
        }

        static double ValidateNumber(string message)
        {
            while (true)
            {
                Console.WriteLine(message);
                string input = Console.ReadLine().Trim();

                double guess = double.Parse(input);

                    return guess;
            }
        }
    }
}
