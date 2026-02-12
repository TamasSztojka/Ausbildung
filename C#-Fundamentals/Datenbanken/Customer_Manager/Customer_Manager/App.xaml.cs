using Customer_Manager.Data;
using Customer_Manager.View;
using Customer_Manager.ViewModel;
using System.Windows;

namespace Customer_Manager
{
    public partial class App : Application
    {
        public static UserRepository? UserRepo;
        public static CustomerRepository? CustomerRepo;

        protected override void OnStartup(StartupEventArgs ev)
        {
            base.OnStartup(ev);

            var db = new DbConnectionFactory(
                "server=localhost;database=customer_manager;uid=root;pwd=Sztojka5728;");
            UserRepo = new UserRepository(db);
            CustomerRepo = new CustomerRepository(db);

            new LoginView
            {
                DataContext = new LoginViewModel(UserRepo)
            }.Show();
        }

        public static void CloseFor(object viewModel)
        {
            var window = Current.Windows.OfType<Window>()
                .FirstOrDefault(x => ReferenceEquals(x.DataContext, viewModel));
            window?.Close();
        }
    }
}
