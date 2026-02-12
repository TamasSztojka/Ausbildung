using System;
using System.Collections.Generic;
using System.Text;

namespace Customer_Manager.Model
{
    public class User
    {
        public int Id { get; set; }
        public string Username { get; set; } = "";
        public string Password { get; set; } = "";
    }
}
