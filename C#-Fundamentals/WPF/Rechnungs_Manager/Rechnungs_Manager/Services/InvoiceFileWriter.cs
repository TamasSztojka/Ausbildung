using Rechnungs_Manager.Models;
using System.Globalization;
using System.IO;
using System.Text;

namespace Rechnungs_Manager.Services
{
    public static class InvoiceFileWriter
    {
        public static Task Save(string filePath, Invoice invoice)
        {
            var de = CultureInfo.GetCultureInfo("de-AT");

            var sb = new StringBuilder();
            sb.AppendLine("======================================");
            sb.AppendLine("INVOICE / RECHNUNG");
            sb.AppendLine("======================================");
            sb.AppendLine($"Company:   {invoice.CompanyName}");
            sb.AppendLine($"Customer:  {invoice.Customer.Name}");
            sb.AppendLine($"Cust No.:  {invoice.Customer.Number}");
            sb.AppendLine($"Date:      {invoice.CreatedAt:dd.MM.yyyy HH:mm}");
            sb.AppendLine();

            sb.AppendLine("Items:");
            sb.AppendLine("--------------------------------------");

            int index = 1;
            foreach (var item in invoice.Items)
            {
                sb.AppendLine($"{index}. {item.ProductName}");
                sb.AppendLine($"   Qty: {item.Quantity}   Unit: {item.PricePerUnit.ToString("C", de)}   Total: {item.Total.ToString("C", de)}");
                index++;
            }

            sb.AppendLine("--------------------------------------");
            sb.AppendLine($"Net Total:    {invoice.NetTotal.ToString("C", de)}");
            sb.AppendLine($"Tax (20%):    {invoice.TaxAmount.ToString("C", de)}");
            sb.AppendLine($"Gross Total:  {invoice.GrossTotal.ToString("C", de)}");
            sb.AppendLine("======================================");

            return File.WriteAllTextAsync(filePath, sb.ToString(), Encoding.UTF8);
        }
    }
}
