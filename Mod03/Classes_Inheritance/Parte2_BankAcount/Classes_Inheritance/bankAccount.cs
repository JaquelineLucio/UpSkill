using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes_Inheritance
{
    //enum typeAccount { poupança, corrente}
    public abstract class metodos{

    }
    abstract class bankAccount
    {
        /*Name of the depositor.
         Account number.
         Type of account.
         Balance amount in the account.
         Member functions:
         --To assign initial values.
         --To deposit an amount.
         --To withdraw an amount after checking the balance.
         --To display the name and balance.*/

        private string NameDepositor;
        public string getNameDepositor() { return NameDepositor; }
        public void setNameDepositor(string n) { NameDepositor = n;  }
        //----------------------------------------
        private string AccountNumber;
        public string getAccountNumber() { return AccountNumber; }
        public void setAccountNumber(string a) { AccountNumber = a; }
        //------------------------------------------
        private double Balance = 0.0;
        public double getBalance() { return Balance; }
        public void setBalance(double b) { Balance = b; }
        //------------------------------------------
       // public abstract string TypeaAccount();
        
        /*----------Construtores----------------*/
        public bankAccount(string name, string accountNumber)
        {
            this.NameDepositor = name;
            this.AccountNumber = accountNumber;
        }
        public bankAccount(){}

        /*---------------------------------------*/
        public void initialValues(double x)
        {
            Balance = x;
        }
        public void depositAmount(double x)
        {
            Balance += x;
        }
        public void withdraw(double x)
        {
            if (Balance > x)
            {
                Balance -= x;
            }else
            {
                throw new Exception("Saldo insuficiente");
            }
        }
        public void nameBalance()
        {
            Console.Write("Name: "+NameDepositor + ", Balance:" + Balance);
        }
    }

    class SavingsAccount : bankAccount
    {
      /*  public override string AccountType()
        {
            return "";
        }*/
        private string type;
        public string getType() { return type; }
        public void setType(string t) { type = t; }

        public SavingsAccount (string name, string accountNumber): base(name, accountNumber)
        {
            this.type = "Savings Account";
        }
    }
    class CheckAccount : bankAccount
    {
        private string type;
        public string getType() { return type; }
        public void setType(string t) { type = t; }

        public CheckAccount(string name, string accountNumber) : base(name, accountNumber)
        {
            this.type = "Check Account";
        }
    }
}