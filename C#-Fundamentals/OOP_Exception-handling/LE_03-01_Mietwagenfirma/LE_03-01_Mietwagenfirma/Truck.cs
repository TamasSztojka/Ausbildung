using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public class Truck : Vehicles, ILoanCalculate
    {
        public int payload { get; private set; }
        public string construction { get; private set; }
        public int axleNumber {  get; private set; }

        public Truck(string manufacturer, string model, int year, string licensePlate,
                    int payload, string construction, int axleNumber)
                : base(manufacturer, model, year, licensePlate)
        {
            this.payload = payload;
            this.construction = construction;
            this.axleNumber = axleNumber;
        }

        public override void showDetails()
        {
            Console.WriteLine($"Car info: {manufacturer} {model}, Year {year}, License Plate: {licensePlate}");
            Console.WriteLine($"Tank: {payload}, Doors: {construction}, Type: {axleNumber}");
        }

        public decimal calculateLoanPrice(int days)
        {
            return days * 120m;
        }
    }
}
