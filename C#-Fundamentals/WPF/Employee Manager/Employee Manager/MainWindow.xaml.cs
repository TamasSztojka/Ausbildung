using System.Windows;

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