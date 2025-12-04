using System;
using System.Collections.Generic;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    internal class Bike : Vehicles
    {
        private int displacement;
        private string type;

        public int Displacement => displacement;
        public string Type => type;

        public Bike(string manufacturer, string model, int year, string licensePlate,
                    int displacement, string type)
            : base(manufacturer, model, year, licensePlate)
        {
            this.displacement = displacement;
            this.type = type;
        }

        public override void showDetails()
        {
            Console.WriteLine($"Car info: {Manufacturer} {Model}, Year {Year}, License Plate: {LicensePlate}");
            Console.WriteLine($"Displacement: {displacement}, Type: {Type}");
        }
    }
}
