using System;
using System.Collections.Generic;
using System.Text;

namespace EventManagement.Model
{
    public class EmailNotifier: IEventNotifier
    {
        public void Notify(Participant participant, Event ev)
        {
            Console.WriteLine(
                $"E-Mail an {participant.Email}" +
                $" Sie wurden für das Event '{ev.Name}' registriert."
                );
        }
    }
}
