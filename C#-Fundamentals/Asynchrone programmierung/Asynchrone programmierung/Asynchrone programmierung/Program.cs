using System.Text;

class Program
{
    static async Task Main(string[] args)
    {
        string filePath = "test.txt";

        try
        {
            var readTask = ReadFileAsync(filePath);

            while (!readTask.IsCompleted)
            {
                Console.WriteLine("File is loading...");
                await Task.Delay(500);
            }

            string content = await readTask;

            Console.WriteLine("\n--- File contents ---");
            Console.WriteLine(content);
        }
        catch (FileNotFoundException)
        {
            Console.WriteLine("The file wasn't found.");
        }
        catch (UnauthorizedAccessException)
        {
            Console.WriteLine("You have no access to this file.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }

    static async Task<string> ReadFileAsync(string path)
    {
        var sb = new StringBuilder();

        using var reader = new StreamReader(path);

        string? line;
        while ((line = await reader.ReadLineAsync()) != null)
        {
            sb.AppendLine(line);
        }

        return sb.ToString();
    }
}