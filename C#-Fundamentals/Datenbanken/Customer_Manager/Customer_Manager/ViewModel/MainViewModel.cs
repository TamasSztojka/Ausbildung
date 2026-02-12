using Customer_Manager.Data;
using Customer_Manager.Model;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;

namespace Customer_Manager.ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        private readonly CustomerRepository _repo;
        public ObservableCollection<Customer> Customers { get; } = new();
        public Customer? SelectedCustomer { get; set; }

        public ICommand AddCommand { get; }
        public ICommand EditCommand { get; }
        public ICommand DeleteCommand { get; }

        public MainViewModel(CustomerRepository repo)
        {
            _repo = repo;
            AddCommand = new RelayCommand(_ => Add());
            EditCommand = new RelayCommand(_ => Edit(), _ => SelectedCustomer != null);
            DeleteCommand = new RelayCommand(_ => Delete(), _ => SelectedCustomer != null);
            Load();
        }

        void Load()
        {
            Customers.Clear();
            foreach (var customer in _repo.GetAll()) Customers.Add(customer);
        }

        void Add()
        {
            var customer = new Customer();
            if (Open(customer))
            {
                _repo.Insert(customer);
                Load();
            }
        }

        void Edit()
        {
            var customer = SelectedCustomer!;
            if (Open(customer))
            {
                _repo.Update(customer);
                Load();
            }
        }

        void Delete()
        {
            if (MessageBox.Show("Delete?", "Confirm", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                _repo.Delete(SelectedCustomer!.Id);
                Load();
            }
        }

        bool Open(Customer customer)
        {
            var viewModel = new CustomerEditViewModel(customer);
            var window = new View.CustomerEditView { DataContext = viewModel };
            return window.ShowDialog() == true;
        }
    }
}
