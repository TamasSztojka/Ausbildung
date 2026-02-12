using Customer_Manager.Model;
using MySql.Data.MySqlClient;
using System.ComponentModel.Design;

namespace Customer_Manager.Data
{
    public class CustomerRepository
    {
        private readonly DbConnectionFactory _db;
        public CustomerRepository(DbConnectionFactory db) => _db = db;

        public List<Customer> GetAll()
        {
            var list = new List<Customer>();
            using var connection = _db.Create();
            connection.Open();

            var command = new MySqlCommand("SELECT * FROM customers", connection);
            using var reader = command.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Customer
                {
                    Id = reader.GetInt32("id"),
                    FirstName = reader.GetString("firstName"),
                    LastName = reader.GetString("lastName"),
                    Street = reader.GetString("street"),
                    HouseNumber = reader.GetString("houseNumber"),
                    ZipCode = reader.GetString("zipCode"),
                    City = reader.GetString("city"),
                    Email = reader.GetString("email")
                });
            }
            return list;
        }

        public void Insert(Customer customer)
        {
            using var connection = _db.Create();
            connection.Open();

            var command = new MySqlCommand(
                @"INSERT INTO customers 
                  (firstName,lastName,street,houseNumber,zipCode,city,email)
                  VALUES (@f,@l,@s,@h,@z,@c,@e)", connection);

            command.Parameters.AddWithValue("@f", customer.FirstName);
            command.Parameters.AddWithValue("@l", customer.LastName);
            command.Parameters.AddWithValue("@s", customer.Street);
            command.Parameters.AddWithValue("@h", customer.HouseNumber);
            command.Parameters.AddWithValue("@z", customer.ZipCode);
            command.Parameters.AddWithValue("@c", customer.City);
            command.Parameters.AddWithValue("@e", customer.Email);
            command.ExecuteNonQuery();
        }

        public void Update(Customer customer)
        {
            using var connection = _db.Create();
            connection.Open();

            var command = new MySqlCommand(
                @"UPDATE customers SET
                  firstName=@f,lastName=@l,street=@s,houseNumber=@h,
                  zipCode=@z,city=@c,email=@e WHERE id=@id", connection);

            command.Parameters.AddWithValue("@id", customer.Id);
            command.Parameters.AddWithValue("@f", customer.FirstName);
            command.Parameters.AddWithValue("@l", customer.LastName);
            command.Parameters.AddWithValue("@s", customer.Street);
            command.Parameters.AddWithValue("@h", customer.HouseNumber);
            command.Parameters.AddWithValue("@z", customer.ZipCode);
            command.Parameters.AddWithValue("@c", customer.City);
            command.Parameters.AddWithValue("@e", customer.Email);
            command.ExecuteNonQuery();
        }

        public void Delete(int id)
        {
            using var connection = _db.Create();
            connection.Open();

            var command = new MySqlCommand("DELETE FROM customers WHERE id=@id", connection);
            command.Parameters.AddWithValue("@id", id);
            command.ExecuteNonQuery();
        }
    }
}
