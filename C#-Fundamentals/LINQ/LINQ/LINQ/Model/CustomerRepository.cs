using System;
using System.Collections.Generic;
using System.Text;

namespace LINQ.Model
{
    internal class CustomerRepository
    {
        public static List<Customer> GetCustomers()
        {
            return new List<Customer>()
            {
                new Customer
                {
                    Name = "Anna Schmidt",
                    Age = 25,
                    City = "Berlin",
                    ProductCategorie = "Elektronik",
                    OrderDate = new DateTime(2023, 3, 15),
                    OrderCost = 199.99m
                },
                new Customer
                {
                    Name = "Max Müller",
                    Age = 42,
                    City = "Hamburg",
                    ProductCategorie = "Bücher",
                    OrderDate = new DateTime(2022, 11, 20),
                    OrderCost = 49.90m
                },
                new Customer
                {
                    Name = "Laura Becker",
                    Age = 31,
                    City = "Berlin",
                    ProductCategorie = "Kleidung",
                    OrderDate = new DateTime(2023, 7, 5),
                    OrderCost = 89.50m
                },
                new Customer
                {
                    Name = "Tim Fischer",
                    Age = 19,
                    City = "München",
                    ProductCategorie = "Elektronik",
                    OrderDate = new DateTime(2024, 1, 10),
                    OrderCost = 129.00m
                },
                new Customer
                {
                    Name = "Sabine Keller",
                    Age = 55,
                    City = "Köln",
                    ProductCategorie = "Haushalt",
                    OrderDate = new DateTime(2021, 6, 2),
                    OrderCost = 75.00m
                },
                new Customer
                {
                    Name = "Jonas Weber",
                    Age = 28,
                    City = "Hamburg",
                    ProductCategorie = "Elektronik",
                    OrderDate = new DateTime(2023, 9, 18),
                    OrderCost = 349.99m
                },
                new Customer
                {
                    Name = "Clara Hoffmann",
                    Age = 34,
                    City = "München",
                    ProductCategorie = "Bücher",
                    OrderDate = new DateTime(2024, 2, 1),
                    OrderCost = 22.95m
                },
                new Customer
                {
                    Name = "Peter Lange",
                    Age = 67,
                    City = "Berlin",
                    ProductCategorie = "Elektronik",
                    OrderDate = new DateTime(2022, 4, 12),
                    OrderCost = 599.00m
                },
                new Customer
                {
                    Name = "Miriam Schulz",
                    Age = 23,
                    City = "Köln",
                    ProductCategorie = "Kleidung",
                    OrderDate = new DateTime(2023, 12, 22),
                    OrderCost = 110.00m
                },
                new Customer
                {
                    Name = "Daniel König",
                    Age = 45,
                    City = "Frankfurt",
                    ProductCategorie = "Haushalt",
                    OrderDate = new DateTime(2023, 8, 30),
                    OrderCost = 180.75m
                }
            };
        }
    }
}
