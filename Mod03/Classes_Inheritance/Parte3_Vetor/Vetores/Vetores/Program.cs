using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vetores
{
    internal class Program
    {
        static void testeVetores()
        {
            floatVector floatVector = new floatVector();

            Console.WriteLine("Criando um vetor:");
            float[] a = {45.3F, 145.3F, 785.6987F};
            floatVector.create(a);

            float[] b = {75.325F, 52.98F };
            Console.WriteLine("\nModificando:");
            floatVector.modify(b);

            floatVector.multiply();

            floatVector.displayVector();
        }
        static void Main(string[] args)
        {
            testeVetores();
            Console.ReadKey();

        }
    }
}
