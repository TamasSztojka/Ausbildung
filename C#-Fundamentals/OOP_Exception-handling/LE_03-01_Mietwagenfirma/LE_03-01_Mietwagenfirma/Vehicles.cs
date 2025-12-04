using System;
using System.Collections.Generic;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public abstract class Vehicles
    {
        private string manufacturer;
        private string model;
        private int year;
        private string licensePlate;

        public string Manufacturer => manufacturer;
        public string Model => model;
        public int Year => year;
        public string LicensePlate => licensePlate;

        public Vehicles(string manufacturer, string model, int year, string licensePlate)
        {
            this.manufacturer = manufacturer;
            this.model = model;
            this.year = year;
            this.licensePlate = licensePlate;
        }

        public abstract void showDetails();
    }
}
