using LE_03_01_Mietwagenfirma;
using Menu_Library.tools;

class Program
{
    static void Main(string[] args)
    {
        VehiclesManager vehiclesManager= new VehiclesManager();

        List<string> menuEntries = new List<string>
        {
            "1. Add Vehicle",
            "2. Show Vehicles",
            "3. Show loan price",
            "3. Exit"
        };

        bool repeat = true;

        while (repeat)
        {

            Menu menu = new Menu(menuEntries);

            int choice = menu.GetChoice();

            switch (choice)
            {
                case 1:
                    vehiclesManager.addVehicle();
                    break;

                case 2:
                    vehiclesManager.showVehicles();
                    break;

                case 3:
                    vehiclesManager.calculateLoan();
                    break;

                case 4:
                    Console.WriteLine("Exiting.....");
                    repeat = false;
                    break;

                default:
                    Console.WriteLine("Invalid Selection");
                    break;
            }
        }
    }
}