using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Validation_Library;

namespace LE_03_01_Mietwagenfirma
{
    public class VehiclesManager
    {
        private List<Vehicles> vehicles = new List<Vehicles>();
        
        public void addVehicle()
        {
            Console.Clear();

            Console.WriteLine("Choose vehicle type:");
            Console.WriteLine("1. Car");
            Console.WriteLine("2. Truck");
            Console.WriteLine("3. Bike");

            int type = Validation.readIntInRange("Enter choice (1-3)", 1, 3);

            switch (type)
            {
                case 1:
                    addCar();
                    break;

                case 2:
                    addTruck();
                    break;

                case 3:
                    addBike();
                    break;
            }
        }

        private (string manufacturer, string model, int year, string license) ReadBaseVehicleData()
        {
            string manufacturer = Validation.readNonEmptyString("Enter Manufacturer:");
            string model = Validation.readNonEmptyString("Enter Model:");
            int year = Validation.readPositiveInt("Enter Year:");
            string license = Validation.readNonEmptyString("Enter License Plate:");

            return (manufacturer, model, year, license);
        }

        private void addCar()
        {
            var data = ReadBaseVehicleData();

            int fuel = Validation.readPositiveInt("Enter Tank Capacity:");
            int doors = Validation.readPositiveInt("Enter Number of Doors:");
            string typeName = Validation.readNonEmptyString("Enter Car Type(SUV, Sedan...)");

            Car car = new Car(
                data.manufacturer,
                data.model,
                data.year,
                data.license,
                fuel,
                doors,
                typeName);

            vehicles.Add(car);
            Console.WriteLine("Car added successfully");
        }

        private void addTruck()
        {
            var data = ReadBaseVehicleData();

            int capacity = Validation.readPositiveInt("Enter Load Capacity:");
            string body = Validation.readNonEmptyString("Enter Body Type:");
            int axles = Validation.readPositiveInt("Enter Number of Axles:");

            Truck truck = new Truck(
                data.manufacturer,
                data.model,
                data.year,
                data.license,
                capacity,
                body,
                axles);

            vehicles.Add(truck);
            Console.WriteLine("Truck added successfully!");
        }

        private void addBike()
        {
            var data = ReadBaseVehicleData();

            int cc = Validation.readPositiveInt("Enter Engine CC:");
            string type = Validation.readNonEmptyString("Enter Bike Type:");

            Bike bike = new Bike(
                data.manufacturer,
                data.model,
                data.year,
                data.license,
                cc,
                type);

            vehicles.Add(bike);
            Console.WriteLine("Bike added successfully!");
        }

        public void showVehicles(bool withIndex = false)
        {
            Console.Clear();

            if (vehicles.Count == 0)
            {
                Console.WriteLine("No vehicles available.");
                return;
            }

            Console.WriteLine("----- Vehicles List -----");

            for (int i = 0; i < vehicles.Count; i++)
            {
                if (withIndex)
                    Console.Write($"{i + 1}. ");

                vehicles[i].showDetails();
                Console.WriteLine();
            }
        }

        public void calculateLoan()
        {
            Console.Clear();

            if (vehicles.Count == 0)
            {
                Console.WriteLine("No vehicles available.");
                return;
            }

            showVehicles(withIndex: true);

            int choice = Validation.readIntInRange("Enter vehicle number:", 1, vehicles.Count);
            var selected = vehicles[choice - 1];

            if (selected is ILoanCalculate loanVehicle)
            {
                int days = Validation.readPositiveInt("Enter number of loan days:");
                decimal price = loanVehicle.calculateLoanPrice(days);

                Console.WriteLine($"Total loan price: {price} €");
            }
            else
            {
                Console.WriteLine("This vehicle does not support loan calculation.");
            }
        }
    }
}
