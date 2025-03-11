using System;

public class Primos
{
    public void Ejecutar()
    {
        int cantidadPrimos = 50;
        int encontrados = 0;
        int numero = 2;

        while (encontrados < cantidadPrimos)
        {
            if (EsPrimo(numero))
            {
                Console.WriteLine(numero);
                encontrados++;
            }
            numero++;
        }
    }

    private bool EsPrimo(int num)
    {
        if (num < 2) return false;
        for (int i = 2; i <= Math.Sqrt(num); i++)
        {
            if (num % i == 0)
                return false;
        }
        return true;
    }
}
