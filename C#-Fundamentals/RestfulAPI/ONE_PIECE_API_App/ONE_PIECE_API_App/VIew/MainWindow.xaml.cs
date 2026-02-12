using Newtonsoft.Json;
using ONE_PIECE_API_App.Model;
using System.Net.Http;
using System.Windows;

namespace ONE_PIECE_API_App
{
    public partial class MainWindow : Window
    {
        private static readonly HttpClient httpClient = new HttpClient
        {
            BaseAddress = new Uri("https://api.api-onepiece.com")
        };

        private List<Crew> allCrews = new List<Crew>();
        private List<Character> selectedCrewMembers = new List<Character>();

        public MainWindow()
        {
            InitializeComponent();
            LoadAllCrews();
        }

        private async void LoadAllCrews()
        {
            try
            {
                ErrorText.Text = "";

                string crewsResponse =
                    await httpClient.GetStringAsync("/v2/crews/en");

                allCrews =
                    JsonConvert.DeserializeObject<List<Crew>>(crewsResponse)
                    ?? new List<Crew>();

                CrewList.ItemsSource = allCrews;
            }
            catch (Exception exception)
            {
                ErrorText.Text = "Error while loading crews: " + exception.Message;
            }
        }

        private async void CrewList_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs eventArguments)
        {
            if (CrewList.SelectedItem is not Crew selectedCrew)
                return;

            DisplayCrewInformation(selectedCrew);
            await LoadMembersForSelectedCrew(selectedCrew.CrewIdentifier);
        }

        private async Task LoadMembersForSelectedCrew(int crewIdentifier)
        {
            try
            {
                ErrorText.Text = "";

                string membersResponse =
                    await httpClient.GetStringAsync($"/v2/characters/en/crew/{crewIdentifier}");

                selectedCrewMembers =
                    JsonConvert.DeserializeObject<List<Character>>(membersResponse)
                    ?? new List<Character>();

                MemberList.ItemsSource = selectedCrewMembers;

                ClearCharacterInformation();
            }
            catch (Exception exception)
            {
                ErrorText.Text = "Error while loading crew members: " + exception.Message;
            }
        }

        private void ShowMemberDetails_Click(object sender, RoutedEventArgs eventArguments)
        {
            if (MemberList.SelectedItem is not Character selectedCharacter)
            {
                ErrorText.Text = "Please select a crew member first.";
                return;
            }

            ErrorText.Text = "";

            MemberNameText.Text = selectedCharacter.CharacterName ?? "Unknown";

            if (!string.IsNullOrWhiteSpace(selectedCharacter.CharacterBounty)
                && long.TryParse(selectedCharacter.CharacterBounty, out long bountyValue))
            {
                MemberBountyText.Text =
                    $"Bounty: {bountyValue:N0} Berries";
            }
            else
            {
                MemberBountyText.Text =
                    $"Bounty: {selectedCharacter.CharacterBounty ?? "None"}";
            }

            if (selectedCharacter.DevilFruit != null &&
                !string.IsNullOrWhiteSpace(selectedCharacter.DevilFruit.FruitName))
            {
                MemberFruitText.Text =
                    $"Devil Fruit: {selectedCharacter.DevilFruit.FruitName} " +
                    $"({selectedCharacter.DevilFruit.FruitType ?? "Unknown type"})";
            }
            else
            {
                MemberFruitText.Text = "Devil Fruit: None";
            }
        }

        private void DisplayCrewInformation(Crew crew)
        {
            CrewNameText.Text = crew.CrewName ?? "Unknown";
            CrewStatusText.Text = crew.CrewStatus ?? "-";
            CrewTotalPrimeText.Text = FormatBountyValue(crew.CrewTotalBounty);
            CrewYonkoText.Text = ConvertYesNoValue(crew.IsYonkoCrew);
        }

        private static string FormatBountyValue(string? bountyText)
        {
            if (!string.IsNullOrWhiteSpace(bountyText)
                && long.TryParse(bountyText, out long bountyValue))
            {
                return $"{bountyValue:N0} Berries";
            }

            return bountyText ?? "-";
        }

        private static string ConvertYesNoValue(string? value)
        {
            if (string.IsNullOrWhiteSpace(value))
                return "-";

            string normalizedValue = value.Trim().ToLowerInvariant();

            return normalizedValue == "1" ||
                   normalizedValue == "true" ||
                   normalizedValue == "yes" ? "Yes": "No";
        }

        private void ClearCharacterInformation()
        {
            MemberNameText.Text = "";
            MemberBountyText.Text = "";
            MemberFruitText.Text = "";
        }
    }
}