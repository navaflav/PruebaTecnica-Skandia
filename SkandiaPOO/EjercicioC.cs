public class InversorTexto
{
    public void Ejecutar()
    {
        string texto = "prueba de lógica";
        string[] palabras = texto.Split(' ');
        Array.Reverse(palabras);
        string resultado = string.Join(" ", palabras);
        Console.WriteLine(resultado); // R/ lógica de prueba
    }
}
