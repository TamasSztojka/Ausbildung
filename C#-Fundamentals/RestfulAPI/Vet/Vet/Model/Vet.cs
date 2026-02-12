using System;
using System.Collections.Generic;
using System.Text;

namespace Vet.Model
{
    class Vet
    {
        public int VetId { get; set; }
        public string Name { get; set; } = "";
        public string specialization { get; set; } = "";
        public string PhoneNumber { get; set; } = "";
        public string Email { get; set; } = "";
        public string LicenseNumber { get; set; } = "";
    }
}
