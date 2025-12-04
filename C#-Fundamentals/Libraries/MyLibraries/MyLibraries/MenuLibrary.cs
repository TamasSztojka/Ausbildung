using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace Menu_Library.tools
{
    public class Menu
    {
        public Menu(List<string> listOfEntries)
        {
            foreach (var entry in listOfEntries)
            {
                Console.WriteLine(entry);
            }
        }

        public int GetChoice()
        {
            Console.Write("Your choice: ");
            string? input = Console.ReadLine();

            if (int.TryParse(input, out int choice))
            {
                return choice;
            }

            Console.WriteLine("Invalid input.");
            return -1;
        }
    }
}
