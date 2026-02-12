using System;
using System.Collections.Generic;
using System.Text;

namespace Vet.Model
{
    class Treatment
    {   
        public int TreatmentId { get; set; }
        public int PetId { get; set; }
        public int VetId { get; set; }
        public DateTime Date { get; set; }
        public string Diagnosis { get; set; } = "";
        public string Therapie { get; set; } = "";
        public decimal Costs { get; set; }


        //Convenience for UI
        public string VetName { get; set; } = "";
    }
}
