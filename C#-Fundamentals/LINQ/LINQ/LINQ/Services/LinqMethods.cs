using System;
using System.Collections.Generic;
using System.Text;
using LINQ.Model;

namespace LINQ.Services
{
    internal class LinqMethods
    {
        private readonly DateTime startDate = new DateTime(2023, 1, 1);

        public IEnumerable<Customer> FilterByBerlin_Method(List<Customer> customer)
            => customer.Where(c => c.City == "Berlin");

        public IEnumerable<Customer> FilterUnder30_Method(List<Customer> customer)
            => customer.Where(c => c.Age < 30);

        public IEnumerable<Customer> FilterOrderCostOver100_Method(List<Customer> customer)
            => customer.Where(c => c.OrderCost > 100);

        public IEnumerable<Customer> FilterElectronicsOrder_Method(List<Customer> customer)
            => customer.Where(c => c.ProductCategorie == "Elektroik");

        public IEnumerable<Customer> Filter2023_Method(List<Customer> customer)
            => customer.Where(c => c.OrderDate > startDate);

        public IEnumerable<Customer> OrderByName_Method(List<Customer> customer)
            => customer.OrderBy(c => c.Name);

        public IEnumerable<IGrouping<string, Customer>> GroupByCity_Method(List<Customer> customer)
            => customer.GroupBy(c => c.City);

        public IEnumerable<Customer> Top3Oldets_Method(List<Customer> customer)
            => customer.OrderByDescending(c => c.Age).Take(3);

    }
}
