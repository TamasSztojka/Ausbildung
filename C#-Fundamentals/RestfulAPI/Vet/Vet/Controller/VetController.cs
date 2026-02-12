using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using Vet.Model;

namespace Vet.Controller
{
    class VetController
    {
        private readonly string _connectionString;

        //Initializes the controller and reads the database connection string from App.config.
        public VetController()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["VetDb"]?.ConnectionString
            ?? throw new InvalidOperationException("Missing connection string 'VetDb' in App.config");
        }

        // Loads all pets with their owner information from the database.
        public async Task<List<Pets>> LoadPets()
        {
            var pets = new List<Pets>();

            const string sql = @"
                SELECT p.pet_id, p.petowner_id, p.name, p.species, p.breed, p.birthday, o.first_name, o.last_name
                From pets p
                JOIN petowner o ON o.petowner_id = p.petowner_id
                ORDER BY p.name;";

            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            await using var command = new MySqlCommand(sql, connection);
            await using var reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync()) 
            {
                var first = reader.GetString("first_name");
                var last = reader.GetString("last_name");

                pets.Add(new Pets
                {
                    PetId = reader.GetInt32("pet_id"),
                    PetOwnerId = reader.GetInt32("petowner_id"),
                    Name = reader.GetString("name"),
                    Species = reader.GetString("species"),
                    Breed = reader.IsDBNull(reader.GetOrdinal("breed")) ? null : reader.GetString("breed"),
                    Birthday = reader.IsDBNull(reader.GetOrdinal("birthday")) ? null : reader.GetDateTime("birthday"),
                    OwnerName = $"{first} {last}"
                });
            }
            return pets;
        }

        // Loads all treatments for a specific pet, including the vet's name.
        public async Task<List<Treatment>> LoadTreatmentsByPetId(int petId)
        {
            var treatments = new List<Treatment>();

            const string sql = @"
                SELECT t.treatment_id, t.pet_id, t.vet_id, t.date, t.diagnosis, t.therapie, t.costs,
                       v.name AS vet_name
                FROM treatment t
                JOIN vet v ON v.vet_id = t.vet_id
                WHERE t.pet_id = @petId
                ORDER BY t.date DESC;";

            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            await using var command = new MySqlCommand(sql, connection);
            command.Parameters.AddWithValue("@petId", petId);

            await using var reader = await command.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                treatments.Add(new Treatment
                {
                    TreatmentId = reader.GetInt32("treatment_id"),
                    PetId = reader.GetInt32("pet_id"),
                    VetId = reader.GetInt32("vet_id"),
                    Date = reader.GetDateTime("date"),
                    Diagnosis = reader.GetString("diagnosis"),
                    Therapie = reader.GetString("therapie"),
                    Costs = reader.GetDecimal("costs"),
                    VetName = reader.GetString("vet_name")
                });
            }

            return treatments;
        }

        // Calculates and returns the average treatment cost per vet as a formatted string.
        public async Task<string> GetAverageTreatmentCostPerVet()
        {
            var rows = new List<(string VetName, decimal Costs)>();

            const string sql = @"
                SELECT v.name AS vet_name, t.costs
                FROM treatment t
                JOIN vet v ON v.vet_id = t.vet_id";

            await using var connection = new MySqlConnection(_connectionString);
            await connection.OpenAsync();

            await using var command = new MySqlCommand(sql, connection);
            await using var reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                rows.Add((reader.GetString("vet_name"), reader.GetDecimal("costs")));
            }

            var lines = rows
                .GroupBy(record => record.VetName)
                .OrderBy(group => group.Key)
                .Select(group => $"{group.Key}: {group.Average(record => record.Costs):0.00}");

            return "Average treatment cost per vet:\n" + string.Join("\n", lines);
        }
    }
}
