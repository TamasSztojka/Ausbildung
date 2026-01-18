using System.Text.RegularExpressions;

namespace EmployeeManager
{
    public class EmployeeProcessor
    {
        public async Task<string> ProcessAsync(string nameInput, string ageInput)
        {
            await Task.Delay(5000);

            string name = nameInput.Trim();
            string ageText = ageInput.Trim();

            if (string.IsNullOrWhiteSpace(name))
                return "Name can not be empty.";

            if (!Regex.IsMatch(name, @"^[a-zA-ZäöüÄÖÜß\s]+$"))
                return "Name is only allowed to have letters.";

            if (string.IsNullOrWhiteSpace(ageText))
                return "Age can not be empty.";

            if (!int.TryParse(ageText, out int age))
                return "Age must be a number.";

            if (age < 15 || age > 120)
                return "Please enter a realistic age. (15-120)";

            return $"Welcome, {name}! Your age is {age} years.";
        }
    }
}
