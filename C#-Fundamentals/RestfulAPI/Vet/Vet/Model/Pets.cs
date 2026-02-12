using System;
using System.Collections.Generic;
using System.Text;

namespace Vet.Model
{
    class Pets
    {
        public int PetId { get; set; }
        public int PetOwnerId { get; set; }
        public string Name { get; set; } = "";
        public string Species { get; set; } = "";
        public string? Breed { get; set; }
        public DateTime? Birthday { get; set; }

        //Convenience for UI
        public string OwnerName { get; set; } = "";
        public string Display => $"{Name} ({Species}) - Owner: {OwnerName}";
    }
}
