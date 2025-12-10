using System;
using System.IO;

namespace Dial_Password
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] lines = File.ReadAllLines(("Dial_turns.txt"));

            int position = 50;
            int zeroCount = 0;

            foreach (string line in lines)
            {
                char direction = line[0];
                int amount = int.Parse(line.Substring(1));

                if (direction == 'R')
                {
                    position = (position + amount) % 100;

                }

                else
                {
                    position = (position - amount) % 100;

                    if (position < 0)
                    {
                        position += 100;
                    }
                }

                if (position == 0)
                {
                    zeroCount++;
                }
            }

            Console.WriteLine($"The password is: {zeroCount}");
        }
    }
}
