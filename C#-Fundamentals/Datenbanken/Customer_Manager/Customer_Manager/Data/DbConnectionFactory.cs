using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;

namespace Customer_Manager.Data
{
    public class DbConnectionFactory
    {
        private readonly string _connStr;
        public DbConnectionFactory(string connStr) => _connStr = connStr;
        public MySqlConnection Create() => new MySqlConnection(_connStr);
    }
}
