using System;
using System.Collections.Generic;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public abstract class Vehicles
    {
        public string Manufacturer { get; private set; }
        public string Model {  get; private set; }
        public int Year { get; private set;  }
        public string LicensePlate { get; private set; }

        public Vehicles(string manufacturer, string model, int year, string licensePlate)
        {
            this.Manufacturer = manufacturer;
            this.Model = model;
            this.Year = year;
            this.LicensePlate = licensePlate;
        }

        public abstract void showDetails();
    }
}
