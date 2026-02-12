namespace Swagger_Postman_Api.Model
{
    public class Product
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; } = string.Empty;

        public decimal ProductPrice { get; set; }

        public int ProductStock { get; set; }
    }
}
