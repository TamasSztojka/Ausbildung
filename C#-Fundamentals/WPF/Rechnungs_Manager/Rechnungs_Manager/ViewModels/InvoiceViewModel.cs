using Microsoft.Win32;
using Rechnungs_Manager.Models;
using Rechnungs_Manager.Services;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;

namespace Rechnungs_Manager.ViewModels
{
    public class InvoiceViewModel : BaseViewModel
    {
        private readonly Invoice _invoice = new Invoice();

        private string _productName = "";
        private int _quantity = 1;
        private decimal _pricePerUnit = 0m;

        public string CompanyName
        {
            get => _invoice.CompanyName;
            set { _invoice.CompanyName = value; OnPropertyChanged(); }
        }

        public string CustomerName
        {
            get => _invoice.Customer.Name;
            set { _invoice.Customer.Name = value; OnPropertyChanged(); }
        }

        public string CustomerNumber
        {
            get => _invoice.Customer.Number;
            set { _invoice.Customer.Number = value; OnPropertyChanged(); }
        }

        public string ProductName
        {
            get => _productName;
            set { _productName = value; OnPropertyChanged(); }
        }

        public int Quantity
        {
            get => _quantity;
            set { _quantity = value; OnPropertyChanged(); }
        }

        public decimal PricePerUnit
        {
            get => _pricePerUnit;
            set { _pricePerUnit = value; OnPropertyChanged(); }
        }

        public decimal NetTotal => _invoice.NetTotal;
        public decimal TaxAmount => _invoice.TaxAmount;
        public decimal GrossTotal => _invoice.GrossTotal;

        public RelayCommand AddItemCommand { get; }
        public RelayCommand SaveCommand { get; }

        public InvoiceViewModel()
        {
            AddItemCommand = new RelayCommand(AddItem);
            SaveCommand = new RelayCommand(SaveInvoice);
        }

        private bool IsCustomerNumberValid(string cn)
            => Regex.IsMatch(cn ?? "", @"^KU-\d{4}$");

        private Task AddItem()
        {
            if (!IsCustomerNumberValid(CustomerNumber))
            {
                MessageBox.Show("Customer number must match: KU-1234");
                return Task.CompletedTask;
            }

            if (string.IsNullOrWhiteSpace(ProductName))
            {
                MessageBox.Show("Please enter a product name.");
                return Task.CompletedTask;
            }

            if (Quantity <= 0)
            {
                MessageBox.Show("Quantity must be greater than 0.");
                return Task.CompletedTask;
            }

            if (PricePerUnit < 0)
            {
                MessageBox.Show("Price per unit cannot be negative.");
                return Task.CompletedTask;
            }

            _invoice.Items.Add(new InvoiceItem
            {
                ProductName = ProductName.Trim(),
                Quantity = Quantity,
                PricePerUnit = PricePerUnit
            });


            ProductName = "";
            Quantity = 1;
            PricePerUnit = 0m;

            OnPropertyChanged(nameof(NetTotal));
            OnPropertyChanged(nameof(TaxAmount));
            OnPropertyChanged(nameof(GrossTotal));

            MessageBox.Show("Item added.");
            return Task.CompletedTask;
        }

        private async Task SaveInvoice()
        {
            if (_invoice.Items.Count == 0)
            {
                MessageBox.Show("Add at least one item before saving.");
                return;
            }

            var dialogue = new SaveFileDialog
            {
                Filter = "Text file (*.txt)|*.txt|Word file (*.doc)|*.doc",
                FileName = $"invoice_{CustomerNumber}_{System.DateTime.Now:yyyyMMdd_HHmm}"
            };

            if (dialogue.ShowDialog() == true)
            {
                await InvoiceFileWriter.Save(dialogue.FileName, _invoice);
                MessageBox.Show("Invoice saved.");
            }
        }
    }
}