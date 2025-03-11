using System;

class Program
{
    static void Main(string[] args)
    {
        bool continuar = true;

        while (continuar)
        {
            Console.WriteLine("\n=== MENÚ DE EJERCICIOS ===");
            Console.WriteLine("1. FizzBuzz");
            Console.WriteLine("2. Números Primos");
            Console.WriteLine("3. Inversor de Texto");
            Console.Write("Seleccione una opción (1-3): ");

            string? opcion = Console.ReadLine();

            switch (opcion?.Trim())
            {
                case "1":
                    new FizzBuzz().Ejecutar();
                    break;
                case "2":
                    new Primos().Ejecutar();
                    break;
                case "3":
                    new InversorTexto().Ejecutar();
                    break;
                default:
                    Console.WriteLine("Opción inválida. Intente de nuevo.");
                    continue;
            }

            Console.Write("\n¿Desea volver al menú? (s/n): ");
            string? respuesta = Console.ReadLine();

            if (respuesta == null || !respuesta.Trim().ToLower().Equals("s"))
            {
                continuar = false;
                Console.WriteLine("\nGracias por utilizar el programa de ejercicios de Pruebas Skandia.");
            }
        }
    }
}
