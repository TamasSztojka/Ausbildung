using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public class Car : Vehicles
    {
        private int tankContents;
        private int doors;
        private string typeDescription;

        public int TankContents => tankContents;
        public int Doors => doors;
        public string TypeDescription => typeDescription;

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
            Console.WriteLine($"Car info: {Manufacturer} {Model}, Year {Year}, License Plate: {LicensePlate}");
            Console.WriteLine($"Tank: {TankContents}, Doors: {Doors}, Type: {TypeDescription}");
        }
    }
}
