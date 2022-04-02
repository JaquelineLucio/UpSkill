using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DBAPI;

namespace XPTO_Interface
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnLimpar_Click(object sender, EventArgs e)
        {
            txtLogin.Text = "";
            txtSenha.Text = "";
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            //conectar com BD
            /*CASA*/
            //string sConnection = "Initial Catalog = XPTO; Data source = (localdb)\\MSSQLLocalDB; Integrated Security= true;";
            /*ISCTE*/
            string sConnection = "Initial Catalog = XPTO; Data source = DESKTOP-TBLHV1G\\SQLEXPRESS1; Integrated Security= true;";
            System.Data.SqlClient.SqlConnection cn = SQLTools.OpenBD(sConnection);

            //Variaveis
            string Login = txtLogin.Text;
            string Senha = txtSenha.Text;

            String SQL = "Select count(*) from Leitores where LeitorLogin= '"+Login +"'  and   LeitorSenha ="+Senha;

            DataTable dt = SQLTools.GetDTForSQL(ref cn, SQL);
            string n = dt.Rows[0][0].ToString();
            int i = Int32.Parse(n);


            if (i == 1)
            {
                menu f = new menu();
                f.Show();
            } else
            {
                MessageBox.Show("Dados inseridos incorretos");
            }
            
            SQLTools.CloseBD(ref cn);
        }

        private void btnCadastro_Click(object sender, EventArgs e)
        {
            Cadastro C = new Cadastro();
            C.Show();
        }
    }
}
