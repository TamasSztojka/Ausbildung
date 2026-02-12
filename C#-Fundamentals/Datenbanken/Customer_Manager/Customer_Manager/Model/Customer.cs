using System;
using System.Collections.Generic;
using System.Text;

namespace Customer_Manager.Model
{
    public class Customer
    {
        public int Id { get; set; }
        public string FirstName { get; set; } = "";
        public string LastName { get; set; } = "";
        public string Street { get; set; } = "";
        public string HouseNumber { get; set; } = "";
        public string ZipCode { get; set; } = "";
        public string City { get; set; } = "";
        public string Email { get; set; } = "";
    }
}
