using System;
using System.Collections.Generic;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    internal class Bike : Vehicles, ILoanCalculate
    {
        public int Displacement { get; private set;  }
        public string Type { get; private set; }


        public Bike(string manufacturer, string model, int year, string licensePlate,
                    int displacement, string type)
            : base(manufacturer, model, year, licensePlate)
        {
            this.Displacement = displacement;
            this.Type = type;
        }

        public override void showDetails()
        {
            Console.WriteLine($"Car info: {Manufacturer} {Model}, Year {Year}, License Plate: {LicensePlate}");
            Console.WriteLine($"Displacement: {Displacement}, Type: {Type}");
        }

        public decimal calculateLoanPrice(int days)
        {
            return days * 30m;
        }
    }
}
