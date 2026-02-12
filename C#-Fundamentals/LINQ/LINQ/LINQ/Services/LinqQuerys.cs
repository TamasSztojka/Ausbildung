using System;
using System.Collections.Generic;
using System.Text;
using LINQ.Model;

namespace LINQ.Services
{
    public class LinqQuerys
    {
        DateTime startDate = new DateTime(2023, 1, 1);
        public IEnumerable<Customer> FilterByBerlin_Query(List<Customer> customer)
            => from c in customer
               where c.City == "Berlin"
               select c;
        
        public IEnumerable<Customer> FilterUnder30_Query(List<Customer> customer)
            => from c in customer
               where c.Age < 30
               select c; 

        public IEnumerable<Customer> FilterOrderCostOver100_Query(List<Customer> customer)
            => from c in customer
               where c.OrderCost > 100
               select c;

        public IEnumerable<Customer> FilterElectronicsOrder_Query(List<Customer> customer)
            => from c in customer
               where c.ProductCategorie == "Elektronik"
               select c;

        public IEnumerable<Customer> Filter2023_Query(List<Customer> customer)
            => from c in customer
               where c.OrderDate > startDate
               select c;

        public IEnumerable<IGrouping<string, Customer>> GroupByCity_Query(List<Customer> customers)
            => from c in customers
               group c by c.City;

        public IEnumerable<Customer> Top3Oldest_Query(List<Customer> customers)
            => (from c in customers
                orderby c.Age descending
                select c).Take(3);
    }
}
