public class FizzBuzz
{
    public void Ejecutar()
    {
        for (int i = 1; i <= 100; i++)
        {
            if (i % 3 == 0 && i % 5 == 0)
                Console.WriteLine("Bingo!");
            else if (i % 3 == 0)
                Console.WriteLine("Bin");
            else if (i % 5 == 0)
                Console.WriteLine("Go");
            else
                Console.WriteLine(i);
        }
    }
}
