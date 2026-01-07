using System;
using System.Collections.Generic;
using System.Text;

namespace EventManagement.Model
{
    public class Participant
    {
        public string Name { get; }
        public string Email { get; }

        public Participant(string name, string email)
        {
            Name = name;
            Email = email;
        }
    }
}
