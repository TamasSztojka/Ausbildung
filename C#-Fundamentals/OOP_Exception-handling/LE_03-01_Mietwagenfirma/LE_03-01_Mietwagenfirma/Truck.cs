using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public class Truck : Vehicles
    {
        private int payload;
        private string construction;
        private int axleNumber;

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
            Console.WriteLine($"Car info: {Manufacturer} {Model}, Year {Year}, License Plate: {LicensePlate}");
            Console.WriteLine($"Tank: {payload}, Doors: {construction}, Type: {axleNumber}");
        }
    }
}
