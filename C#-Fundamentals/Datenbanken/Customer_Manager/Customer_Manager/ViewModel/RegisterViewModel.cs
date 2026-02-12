using Customer_Manager.Data;
using Customer_Manager.View;
using System.Windows.Input;

namespace Customer_Manager.ViewModel
{
    public class RegisterViewModel : BaseViewModel
    {
        private readonly UserRepository _users;

        private string _username = "";
        public string Username
        {
            get => _username;
            set
            {
                if (_username == value) return;
                _username = value;
                OnPropertyChanged();
            }
        }

        private string _password = "";
        public string Password
        {
            get => _password;
            set
            {
                if (_password == value) return;
                _password = value;
                OnPropertyChanged();
            }
        }

        private string _errorMessage = "";
        public string ErrorMessage
        {
            get => _errorMessage;
            set
            {
                if (_errorMessage == value) return;
                _errorMessage = value;
                OnPropertyChanged();
            }
        }

        public ICommand RegisterCommand { get; }
        public ICommand BackCommand { get; }

        public RegisterViewModel(UserRepository users)
        {
            _users = users;

            RegisterCommand = new RelayCommand(_ => Register());
            BackCommand = new RelayCommand(_ =>
            {
                new LoginView { DataContext = new LoginViewModel(_users) }.Show();
                Close();
            });
        }

        private void Register()
        {
            ErrorMessage = "";

            var username = (Username ?? "").Trim();
            var password = Password ?? "";

            if (string.IsNullOrWhiteSpace(username))
            {
                ErrorMessage = "Username cannot be empty.";
                return;
            }

            if (string.IsNullOrWhiteSpace(password))
            {
                ErrorMessage = "Password cannot be empty.";
                return;
            }

            if (_users.Get(username) != null)
            {
                ErrorMessage = "User exists.";
                return;
            }

            try
            {
                _users.Create(username, password);

                new LoginView { DataContext = new LoginViewModel(_users) }.Show();
                Close();
            }
            catch
            {
                ErrorMessage = "Failed to create user.";
            }
        }

        private void Close() => App.CloseFor(this);
    }
}