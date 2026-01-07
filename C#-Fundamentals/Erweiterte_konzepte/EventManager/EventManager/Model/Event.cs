using System;
using System.Collections.Generic;
using System.Text;

namespace EventManagement.Model
{
    public class Event
    {
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public string Location { get; set; }

        public Event(string name, DateTime date, string location)
        {
            Name = name;
            Date = date;
            Location = location;
        }
    }
}
