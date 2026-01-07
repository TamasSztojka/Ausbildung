using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public class Car : Vehicles, ILoanCalculate
    {
        public int TankContents { get; private set; }
        public int Doors { get; private set; }
        public string TypeDescription {  get; private set; }

        public Car(string manufacturer, string model, int year, string licensePlate,
                    int tankContents, int doors, string type)
            : base(manufacturer, model, year, licensePlate)

        {
            this.TankContents = tankContents;
            this.Doors = doors;
            this.TypeDescription = type;
        }

        public override void showDetails()
        {
            Console.WriteLine($"Car info: {Manufacturer} {Model}, Year {Year}, License Plate: {LicensePlate}");
            Console.WriteLine($"Tank: {TankContents}, Doors: {Doors}, Type: {TypeDescription}");
        }

        public decimal calculateLoanPrice(int days)
        {
            return days * 50m;
        }
    }
}
