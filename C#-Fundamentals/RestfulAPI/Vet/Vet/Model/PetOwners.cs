using System;
using System.Collections.Generic;
using System.Text;

namespace Vet.Model
{
    class PetOwners
    {
        public int PetOwnerId { get; set; }
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";
        public string Address { get; set; } = "";
        public string? PhoneNumber { get; set; }
        public string? Email { get; set; }

        public string FullName => $"{FirstName} {LastName}";


    }
}
