using Customer_Manager.Model;
using MySql.Data.MySqlClient;

namespace Customer_Manager.Data
{
    public class UserRepository
    {
        private readonly DbConnectionFactory _db;
        public UserRepository(DbConnectionFactory db) => _db = db;

        public User? Get(string username)
        {
            using var connection = _db.Create();
            connection.Open();

            var command = new MySqlCommand(
                "SELECT * FROM users WHERE username=@u", connection);
            command.Parameters.AddWithValue("@u", username);

            using var reader = command.ExecuteReader();
            if (!reader.Read()) return null;

            return new User
            {
                Id = reader.GetInt32("id"),
                Username = reader.GetString("username"),
                Password = reader.GetString("password")
            };
        }

        public void Create(string username, string password)
        {
            using var connection = _db.Create();
            connection.Open();

            var command = new MySqlCommand(
                "INSERT INTO users (username,password) VALUES (@u,@p)", connection);
            command.Parameters.AddWithValue("@u", username);
            command.Parameters.AddWithValue("@p", password);
            command.ExecuteNonQuery();
        }
    }
}
