using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public class Truck : Vehicles, ILoanCalculate
    {
        public int Payload { get; private set; }
        public string Construction { get; private set; }
        public int AxleNumber {  get; private set; }

        public Truck(string manufacturer, string model, int year, string licensePlate,
                    int payload, string construction, int axleNumber)
                : base(manufacturer, model, year, licensePlate)
        {
            this.Payload = payload;
            this.Construction = construction;
            this.AxleNumber = axleNumber;
        }

        public override void showDetails()
        {
            Console.WriteLine($"Car info: {Manufacturer} {Model}, Year {Year}, License Plate: {LicensePlate}");
            Console.WriteLine($"Tank: {Payload}, Doors: {Construction}, Type: {AxleNumber}");
        }

        public decimal calculateLoanPrice(int days)
        {
            return days * 120m;
        }
    }
}
