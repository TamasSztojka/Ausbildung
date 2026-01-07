using EventManagement.Controller;
using Menu_Library.tools;

class Program
{
    static void Main()
    {
        EventController controller = new EventController();
        bool running = true;

        while (running)
        {
            Console.WriteLine("\n=== EVENT MANAGEMENT SYSTEM ===");

            var menuEntries = new List<string>
            {
                "1 - Create Event",
                "2 - Add Participant to Event",
                "0 - Exit"
            };

            Menu menu = new Menu(menuEntries);
            int choice = menu.GetChoice();

            switch (choice)
            {
                case 1:
                    controller.CreateEvent();
                    break;

                case 2:
                    controller.AddParticipant();
                    break;

                case 0:
                    running = false;
                    break;

                default:
                    Console.WriteLine("Invalid menu choice.");
                    break;
            }
        }
    }
}