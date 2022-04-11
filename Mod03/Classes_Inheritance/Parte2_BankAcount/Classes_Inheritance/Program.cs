using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes_Inheritance
{
    internal class Program
    {
        static void testeAccount()
        {
            //string name, string accountNumber, string typeAccoount, double balance
            SavingsAccount c = new SavingsAccount("Jaque", "456236");
            Console.WriteLine(c.getNameDepositor()+" - "+ c.getBalance());
            c.initialValues(450.35);
            Console.WriteLine(c.getBalance());
            c.depositAmount(450);
            Console.WriteLine(c.getBalance()+" - "+c.getType());
          //  c.withdraw(1000);
          //  Console.WriteLine(c.getBalance());
            c.nameBalance();


            /*---------------------*/
            CheckAccount ca = new CheckAccount("Gabriel", "56258");
            Console.WriteLine("\n\n"+ca.getNameDepositor() + " - " + ca.getBalance());
            ca.initialValues(100);
            Console.WriteLine(ca.getBalance());
            ca.depositAmount(450);
            Console.WriteLine(ca.getBalance() + " - " + ca.getType());
            //  c.withdraw(1000);
            //  Console.WriteLine(c.getBalance());
            ca.nameBalance();
        }
        static void Main(string[] args)
        {
            testeAccount();
            Console.ReadKey();
        }
    }
}
