using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vetores
{
     abstract class vector
    {
        private float[] x;

        /*---Construtores-----------*/
        public vector(float[] a)
        {
            x = new float[a.Length];
            this.x = a;
        }
        public vector() { }
        /*--------------------------*/
        public void create(float[] a)
        {
            x = new float[a.Length];
            int i = a.Length;

            for (int j = 0; j < i; j++)
            {
                x[j]= (a[j]);
                Console.WriteLine(x[j] + "; ");
            }
        }
      public void modify(float[] a) 
        {
            int i = a.Length;
            for (int j = 0; j < i; j++)
            {
                x[j] = (a[j]);
                Console.WriteLine(x[j] + "; ");
            }
        }
        public void multiply()
        {
            float p = 1F;
            for (int i = 0; i < x.Length; i++)
            {
                p *= x[i];
            }
            Console.WriteLine("O produto do vetor é: "+ Math.Round(p, 2));
            Console.WriteLine("O produto do vetor é: " + p);

        }
        public void displayVector()
        {
            int i = x.Length;
            Console.Write("\n[");

            //Sorte ordenar crescente
            Array.Sort(x);

            for (int j = 0; j < i; j++)
            {
                if(j == (i-1))
                {
                    Console.Write(Math.Round(x[j], 0));
                }
                else {
                Console.Write(Math.Round(x[j], 0) + ", ");
                }

            }
            Console.Write("]");

        }
    }
    class floatVector : vector 
    {
        private float[] x;
        //public floatVector getx() { return x[]; }
        public void setx(float[] x) { this.x = x;}

        public floatVector(){ }
        
    }
}