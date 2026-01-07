using System;
using System.Collections.Generic;
using System.Text;

namespace EventManagement.Model
{
    public interface IEventNotifier
    {
        void Notify(Participant participant, Event ev);
    }
}
