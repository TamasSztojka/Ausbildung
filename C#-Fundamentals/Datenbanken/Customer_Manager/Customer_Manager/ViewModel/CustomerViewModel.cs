using Customer_Manager.Model;
using System.Windows.Input;

namespace Customer_Manager.ViewModel
{
    public class CustomerEditViewModel : BaseViewModel
    {
        public Customer Customer { get; }
        public ICommand SaveCommand { get; }
        public ICommand CancelCommand { get; }
        public Action<bool>? CloseDialog { get; set; }

        public CustomerEditViewModel(Customer customer)
        {
            Customer = customer;
            SaveCommand = new RelayCommand(_ => CloseDialog?.Invoke(true));
            CancelCommand = new RelayCommand(_ => CloseDialog?.Invoke(false));
        }
    }
}
