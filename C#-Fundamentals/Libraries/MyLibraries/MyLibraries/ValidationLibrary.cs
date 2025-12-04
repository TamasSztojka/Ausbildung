using System;
using System.Collections.Generic;
using System.Text;

namespace ValidationLibrary
{
    internal class ValidationLibrary
    {
        public static int readInt(string message)
        {
            Console.WriteLine(message);

            int value;
            while (!int.TryParse(Console.ReadLine(), out value))
            {
                Console.Write("Invalid number. " + message);
            }

            return value;
        }

        public static int readIntInRange(string message, int min, int max)
        {
            int value;
            do
            {
                value = readInt(message);
                if (value < min || value > max)
                {
                    Console.WriteLine($"Value must be between {min} and {max}!");

                }
            }
            while (value < min || value > max);

            return value;
        }

        public static int readPositiveInt(string message)
        {
            int value;
            do
            {
                value = readInt(message);
                if (value < 0)
                {
                    Console.WriteLine("Value must be positive");
                }
            }
            while (value <= 0);

            return value;
        }

        public static string readNonEmptyString(string message)
        {
            Console.WriteLine(message);
            string input = Console.ReadLine().Trim();

            while (string.IsNullOrEmpty(input))
            {
                Console.WriteLine("Input cannot be empty");
                Console.WriteLine(message);
                input = Console.ReadLine().Trim();
            }

            return input;
        }
    }
}
