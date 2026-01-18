using System.Windows;

namespace Notizen_Manager
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private async void Add_Click(object sender, RoutedEventArgs ev)
        {
            string text = NoteTextBox.Text.Trim();

            // Validation: no empty notes
            if (string.IsNullOrWhiteSpace(text))
            {
                MessageBox.Show("Note cannot be empty.", "Validation",
                    MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Simulate async work
            await Task.Delay(2000);

            NotesListBox.Items.Add(text);
            NoteTextBox.Clear();
            NoteTextBox.Focus();
        }

        private async void Delete_Click(object sender, RoutedEventArgs ev)
        {
            if (NotesListBox.SelectedItem == null)
            {
                MessageBox.Show("Please select a note to delete.", "Info",
                    MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }

            // Simulate async work
            await Task.Delay(2000);

            NotesListBox.Items.Remove(NotesListBox.SelectedItem);
        }
    }
}