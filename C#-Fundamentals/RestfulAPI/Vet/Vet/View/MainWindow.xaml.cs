using System.Drawing;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Vet.Controller;
using Vet.Model;

namespace Vet
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly VetController _controller = new VetController();
        private List<Pets> _pets = new();


        // Initializes the window and loads all data when the window is loaded.
        public MainWindow()
        {
            InitializeComponent();

            Loaded += async (sender, e) => await ReloadAll();
        }


        //Reloads all pets and related data from the database when button is clicked.
        private async void BtnReload_Click(object sender, RoutedEventArgs e)
        {
            await ReloadAll();
        }


        //Loads treatments for the selected pet.
        private async void ListPets_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ListPets.SelectedItem is not Pets pet) return;
            await LoadTreatmentsForPet(pet);
        }


        //Loads all pets and statistics from the controller and updates the UI.
        private async Task ReloadAll()
        {
            try
            {
                SetLoading(true, "Loading data...");

                _pets = await _controller.LoadPets();
                ListPets.ItemsSource = _pets;

                TxtStats.Text = await _controller.GetAverageTreatmentCostPerVet();

                if (_pets.Count > 0)
                    ListPets.SelectedIndex = 0;

                SetLoading(false, "Ready");
            }
            catch (Exception ex)
            {
                SetLoading(false, "Error");
                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Loads treatments for a specific pet and displays them in the grid.
        private async Task LoadTreatmentsForPet(Pets pet)
        {
            try
            {
                SetLoading(true, $"Loading treatments for {pet.Name}...");

                var treatments = await _controller.LoadTreatmentsByPetId(pet.PetId);


                GridTreatments.ItemsSource = treatments;

                SetLoading(false, "Ready");
            }
            catch (Exception ex)
            {
                SetLoading(false, "Error");
                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        //Enables or disables UI elements and updates the status text during loading.
        private void SetLoading(bool isLoading, string status)
        {
            BtnReload.IsEnabled = !isLoading;
            ListPets.IsEnabled = !isLoading;
            TxtStatus.Text = status;
        }
    }
}