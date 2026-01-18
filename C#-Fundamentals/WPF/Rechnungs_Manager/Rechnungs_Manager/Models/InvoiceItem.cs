namespace Rechnungs_Manager.Models
{
    public class InvoiceItem
    {
        public string ProductName { get; set; } = "";
        public int Quantity { get; set; } = 1;
        public decimal PricePerUnit { get; set; } = 0m;

        public decimal Total => Quantity * PricePerUnit;
    }
}
