using System.Windows;
using System.Windows.Controls;

namespace Rechnungs_Manager.Views
{
    /// <summary>
    /// Interaktionslogik für LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        private const string AdminUser = "admin12321";
        private const string AdminPass = "password65456";

        public LoginWindow()
        {
            InitializeComponent();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            var username = UsernameBox.Text.Trim();
            var password = PasswordBox.Password;

            if (username == AdminUser && password == AdminPass)
            {
                var main = new MainWindow();
                main.Show();
                Close();
            }
            else
            {
                MessageBox.Show("Invalid username or password.");
            }
        }
    }
}
