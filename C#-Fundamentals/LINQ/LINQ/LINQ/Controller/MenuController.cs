using LINQ.Model;
using LINQ.Services;

namespace LINQ.Controller
{
    public class MenuController
    {
        private readonly List<Customer> _customers;
        private readonly LinqQuerys _querys;
        private readonly LinqMethods _methods;

        public MenuController()
        {
            _customers = CustomerRepository.GetCustomers();
            _querys = new LinqQuerys();
            _methods = new LinqMethods();
        }

        public void Run()
        {
            bool running = true;

            while (running)
            {
                PrintMenu();
                int choice = int.Parse(Console.ReadLine());

                switch (choice)
                {
                    case 1:
                        PrintCustomers(_methods.FilterByBerlin_Method(_customers));
                        break;

                    case 2:
                        PrintCustomers(_methods.FilterUnder30_Method(_customers));
                        break;

                    case 3:
                        PrintCustomers(_methods.FilterOrderCostOver100_Method(_customers));
                        break;

                    case 4:
                        PrintCustomers(_methods.FilterElectronicsOrder_Method(_customers));
                        break;

                    case 5:
                        PrintCustomers(_methods.Filter2023_Method(_customers));
                        break;

                    case 6:
                        PrintCustomers(_methods.OrderByName_Method(_customers));
                        break;

                    case 7:
                        var grouped = _methods.GroupByCity_Method(_customers);
                        PrintGroupedCustomers(grouped);
                        break;

                    case 8:
                        PrintCustomers(_methods.Top3Oldets_Method(_customers));
                        break;

                    case 0:
                        running = false;
                        break;

                    default:
                        Console.WriteLine("Invalid choice");
                        break;
                }
            }
        }

        private void PrintMenu()
        {
            Console.WriteLine("1 - Filter by berlin");
            Console.WriteLine("2 - Customers younger than 30");
            Console.WriteLine("3 - Customers that order over 100€ worth");
            Console.WriteLine("4 - Customers that bought Electroics");
            Console.WriteLine("5 - Customers that ordered after the 1. January 2023");
            Console.WriteLine("6 - All Customers ordered by name (A-Z)");
            Console.WriteLine("7 - Group up Customers based on city");
            Console.WriteLine("8 - The three oldest Customers");
            Console.WriteLine("0 - Exit");
        }

        private void PrintCustomers(IEnumerable<Customer> customers)
        {
            foreach (var c in customers)
            {
                Console.WriteLine(
                    $"{c.Name,-20} | {c.Age,3} | {c.City,-10} | {c.OrderCost,8} €\n"
                );
            }
        }

        private void PrintGroupedCustomers(IEnumerable<IGrouping<string, Customer>> groups)
        {
            foreach (var group in groups)
            {
                Console.WriteLine($"\nCity: {group.Key}");
                PrintCustomers(group);
            }
        }
    }
}
