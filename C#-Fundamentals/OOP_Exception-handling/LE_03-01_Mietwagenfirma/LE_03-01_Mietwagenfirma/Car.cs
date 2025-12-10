using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public class Car : Vehicles, ILoanCalculate
    {
        public int tankContents { get; private set; }
        public int doors { get; private set; }
        public string typeDescription {  get; private set; }

        public Car(string manufacturer, string model, int year, string licensePlate,
                    int tankContents, int doors, string type)
            : base(manufacturer, model, year, licensePlate)

        {
            this.tankContents = tankContents;
            this.doors = doors;
            this.typeDescription = type;
        }

        public override void showDetails()
        {
            Console.WriteLine($"Car info: {manufacturer} {model}, Year {year}, License Plate: {licensePlate}");
            Console.WriteLine($"Tank: {tankContents}, Doors: {doors}, Type: {typeDescription}");
        }

        public decimal calculateLoanPrice(int days)
        {
            return days * 50m;
        }
    }
}
