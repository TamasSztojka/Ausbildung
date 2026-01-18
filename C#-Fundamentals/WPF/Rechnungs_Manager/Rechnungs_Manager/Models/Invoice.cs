using System;
using System.Collections.Generic;
using System.Linq;

namespace Rechnungs_Manager.Models
{
    public class Invoice
    {
        public string CompanyName { get; set; } = "WPFBau";
        public Customer Customer { get; set; } = new Customer();
        public List<InvoiceItem> Items { get; set; } = new List<InvoiceItem>();

        public decimal TaxRate { get; set; } = 0.20m;
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public decimal NetTotal => Items.Sum(i => i.Total);
        public decimal TaxAmount => NetTotal * TaxRate;
        public decimal GrossTotal => NetTotal + TaxAmount;
    }
}
