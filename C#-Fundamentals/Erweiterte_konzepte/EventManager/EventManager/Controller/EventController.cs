using System;
using System.Collections.Generic;
using System.Text;
using Validation_Library;
using EventManagement.Model;

namespace EventManagement.Controller
{
    internal class EventController
    {
        private readonly EventManager eventManager;

        public EventController()
        {
            IEventNotifier notifier = new EmailNotifier();
            eventManager = new EventManager(notifier);

            eventManager.ParticipantAdded += (sender, participant) =>
            {
                Console.WriteLine($"Participant added: {participant.Name}");
            };
        }

        public void CreateEvent()
        {
            string name = Validation.readNonEmptyString("Event name:");
            string location = Validation.readNonEmptyString("Event location:");

            int year = Validation.readPositiveInt("Year:");
            int month = Validation.readIntInRange("Month (1-12):", 1, 12);
            int day = Validation.readIntInRange("Day (1-31):", 1, 31);

            DateTime date = new DateTime(year, month, day);

            Event ev = new Event(name, date, location);
            eventManager.AddEvent(ev);

            Console.WriteLine("Event created successfully!");
        }

        public void AddParticipant()
        {
            Event selectedEvent = SelectEvent();
            if (selectedEvent == null)
                return;

            string name = Validation.readNonEmptyString("Participant name:");
            string email = Validation.readNonEmptyString("Participant email:");

            Participant participant = new Participant(name, email);
            eventManager.AddParticipants(participant, selectedEvent);
        }

        private Event SelectEvent()
        {
            List<Event> events = eventManager.GetEvents();

            if (events.Count == 0)
            {
                Console.WriteLine("No events available.");
                return null;
            }

            Console.WriteLine("\nAvailable Events:");
            for (int i = 0; i < events.Count; i++)
            {
                Console.WriteLine(
                    $"{i + 1} - {events[i].Name} ({events[i].Location}, {events[i].Date:d})"
                );
            }

            int choice = Validation.readIntInRange(
                "Select an event:",
                1,
                events.Count
            );

            return events[choice - 1];
        }
    }
}