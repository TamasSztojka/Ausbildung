using System;
using System.Collections.Generic;
using System.Text;

namespace EventManagement.Model
{
    public class EventManager
    {
        public event ParticipantAddedHandler ParticipantAdded;

        private readonly List<Event> events = new();
        private readonly List<Participant> participants = new();
        private readonly IEventNotifier notifier;

        public EventManager(IEventNotifier notifier)
        {
            this.notifier = notifier;
        }

        public void AddEvent(Event ev)
        {
            events.Add(ev);
        }

        public List<Event> GetEvents()
        {
            return events; 
        }

        public void AddParticipants(Participant participant, Event ev)
        {
            participants.Add(participant);

            ParticipantAdded?.Invoke(this, participant);
            notifier.Notify(participant, ev);
        }
    }
}
