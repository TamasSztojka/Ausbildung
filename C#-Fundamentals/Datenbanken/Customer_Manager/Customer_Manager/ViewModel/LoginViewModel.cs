using Customer_Manager.Data;
using Customer_Manager.View;
using System;
using System.Windows.Input;

namespace Customer_Manager.ViewModel
{
    public class LoginViewModel : BaseViewModel
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

        public ICommand LoginCommand { get; }
        public ICommand RegisterCommand { get; }

        public LoginViewModel(UserRepository users)
        {
            _users = users;

            LoginCommand = new RelayCommand(_ => Login());
            RegisterCommand = new RelayCommand(_ =>
            {
                new RegisterView { DataContext = new RegisterViewModel(_users) }.Show();
                Close();
            });
        }

        private void Login()
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

            try
            {
                var user = _users.Get(username);

                if (user == null)
                {
                    ErrorMessage = "User not found.";
                    return;
                }

                if (user.Password != password)
                {
                    ErrorMessage = "Wrong password.";
                    return;
                }

                new MainView { DataContext = new MainViewModel(App.CustomerRepo!) }.Show();
                Close();
            }
            catch
            {
                ErrorMessage = "Login failed (database error).";
            }
        }

        private void Close() => App.CloseFor(this);
    }
}