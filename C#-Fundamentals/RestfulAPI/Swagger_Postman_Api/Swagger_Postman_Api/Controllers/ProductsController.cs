using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Swagger_Postman_Api.Model;
using Swagger_Postman_Api.Services;

namespace Swagger_Postman_Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly MySqlDatabaseService mySqlDatabaseService;

        public ProductsController(MySqlDatabaseService mySqlDatabaseService)
        {
            this.mySqlDatabaseService = mySqlDatabaseService;
        }

        // GET: api/products
        [HttpGet]
        public async Task<IActionResult> GetAllProducts()
        {
            List<Product> products = new List<Product>();

            try
            {
                await using MySqlConnection connection = await mySqlDatabaseService.OpenDatabaseConnection();

                string query = "SELECT ProductId, ProductName, ProductPrice, ProductStock FROM Products;";

                await using MySqlCommand command = new MySqlCommand(query, connection);

                await using var reader = await command.ExecuteReaderAsync();

                while (await reader.ReadAsync())
                {
                    products.Add(new Product
                    {
                        ProductId = reader.GetInt32(reader.GetOrdinal("ProductId")),
                        ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                        ProductPrice = reader.GetDecimal(reader.GetOrdinal("ProductPrice")),
                        ProductStock = reader.GetInt32(reader.GetOrdinal("ProductStock"))
                    });
                }

                return Ok(products);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        // GET: api/products/5
        [HttpGet("{productIdentifier:int}")]
        public async Task<IActionResult> GetProductById(int productIdentifier)
        {
            if (productIdentifier <= 0)
            {
                return BadRequest("ProductId must be greater than zero.");
            }

            try
            {
                await using MySqlConnection connection = await mySqlDatabaseService.OpenDatabaseConnection();

                string query =
                    "SELECT ProductId, ProductName, ProductPrice, ProductStock " +
                    "FROM Products WHERE ProductId = @ProductId;";

                await using MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@ProductId", productIdentifier);

                await using var reader = await command.ExecuteReaderAsync();

                if (!await reader.ReadAsync())
                {
                    return NotFound("Product not found.");
                }

                Product product = new Product
                {
                    ProductId = reader.GetInt32(reader.GetOrdinal("ProductId")),
                    ProductName = reader.GetString(reader.GetOrdinal("ProductName")),
                    ProductPrice = reader.GetDecimal(reader.GetOrdinal("ProductPrice")),
                    ProductStock = reader.GetInt32(reader.GetOrdinal("ProductStock"))
                };

                return Ok(product);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        // POST: api/products
        [HttpPost]
        public async Task<IActionResult> CreateProduct([FromBody] Product product)
        {
            if (string.IsNullOrWhiteSpace(product.ProductName))
            {
                return BadRequest("ProductName is required.");
            }

            try
            {
                await using MySqlConnection connection = await mySqlDatabaseService.OpenDatabaseConnection();

                string query =
                    "INSERT INTO Products (ProductName, ProductPrice, ProductStock) " +
                    "VALUES (@ProductName, @ProductPrice, @ProductStock); " +
                    "SELECT LAST_INSERT_ID();";

                await using MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@ProductName", product.ProductName);
                command.Parameters.AddWithValue("@ProductPrice", product.ProductPrice);
                command.Parameters.AddWithValue("@ProductStock", product.ProductStock);

                object idObject = await command.ExecuteScalarAsync();
                product.ProductId = Convert.ToInt32(idObject);

                return CreatedAtAction(nameof(GetProductById),
                    new { productIdentifier = product.ProductId }, product);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        // PUT: api/products/5
        [HttpPut("{productIdentifier:int}")]
        public async Task<IActionResult> UpdateProduct(int productIdentifier, [FromBody] Product product)
        {
            try
            {
                await using MySqlConnection connection =
                    await mySqlDatabaseService.OpenDatabaseConnection();

                string query =
                    "UPDATE Products SET ProductName = @ProductName, " +
                    "ProductPrice = @ProductPrice, ProductStock = @ProductStock " +
                    "WHERE ProductId = @ProductId;";

                await using MySqlCommand command =
                    new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@ProductName", product.ProductName);
                command.Parameters.AddWithValue("@ProductPrice", product.ProductPrice);
                command.Parameters.AddWithValue("@ProductStock", product.ProductStock);
                command.Parameters.AddWithValue("@ProductId", productIdentifier);

                int rowsAffected = await command.ExecuteNonQueryAsync();

                if (rowsAffected == 0)
                {
                    return NotFound("Product not found.");
                }

                product.ProductId = productIdentifier;
                return Ok(product);
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }

        // DELETE: api/products/5
        [HttpDelete("{productIdentifier:int}")]
        public async Task<IActionResult> DeleteProduct(int productIdentifier)
        {
            try
            {
                await using MySqlConnection connection = await mySqlDatabaseService.OpenDatabaseConnection();

                string query = "DELETE FROM Products WHERE ProductId = @ProductId;";

                await using MySqlCommand command = new MySqlCommand(query, connection);

                command.Parameters.AddWithValue("@ProductId", productIdentifier);

                int rowsAffected = await command.ExecuteNonQueryAsync();

                if (rowsAffected == 0)
                {
                    return NotFound("Product not found.");
                }

                return Ok("Product deleted successfully.");
            }
            catch (Exception exception)
            {
                return StatusCode(500, exception.Message);
            }
        }
    }
}
