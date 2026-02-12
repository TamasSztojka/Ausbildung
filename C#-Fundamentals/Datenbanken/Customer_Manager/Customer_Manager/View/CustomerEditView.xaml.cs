using Customer_Manager.ViewModel;
using System.Windows;

namespace Customer_Manager.View
{
    public partial class CustomerEditView : Window
    {
        public CustomerEditView()
        {
            InitializeComponent();

            Loaded += (_, __) =>
            {
                if (DataContext is CustomerEditViewModel viewModel)
                {
                    viewModel.CloseDialog = ok =>
                    {
                        DialogResult = ok;
                        Close();
                    };
                }
            };
        }
    }
}