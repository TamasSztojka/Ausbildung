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

namespace EmployeeManager
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly EmployeeProcessor _processor = new EmployeeProcessor();

        public MainWindow()
        {
            InitializeComponent();
        }

        private async void SubmitButton_Click(object sender, RoutedEventArgs e)
        {
            SubmitButton.IsEnabled = false;
            ResultTextBlock.Text = "Processing...";

            string result = await _processor.ProcessAsync(
                NameTextBox.Text,
                AgeTextBox.Text);

            ResultTextBlock.Text = result;
            SubmitButton.IsEnabled = true;
        }
    }
}