using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;

namespace Swagger_Postman_Api.Services
{

    public class MySqlDatabaseService
    {
        private readonly string databaseConnectionString;

        public MySqlDatabaseService(IConfiguration configuration)
        {
            databaseConnectionString =
                configuration.GetConnectionString("MySqlDatabaseConnection")
                ?? throw new InvalidOperationException("Connection string not found.");
        }

        public async Task<MySqlConnection> OpenDatabaseConnection()
        {
            MySqlConnection connection = new MySqlConnection(databaseConnectionString);
            await connection.OpenAsync();
            return connection;
        }
    }
}