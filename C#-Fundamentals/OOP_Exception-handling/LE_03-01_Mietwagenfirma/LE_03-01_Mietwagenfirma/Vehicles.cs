using System;
using System.Collections.Generic;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    public abstract class Vehicles
    {
        public string manufacturer { get; private set; }
        public string model {  get; private set; }
        public int year { get; private set;  }
        public string licensePlate { get; private set; }

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
