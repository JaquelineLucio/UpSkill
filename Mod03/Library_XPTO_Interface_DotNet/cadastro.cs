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
using System.Data.SqlClient;

namespace XPTO_Interface
{
    public partial class Cadastro : Form
    {
        public Cadastro()
        {
            InitializeComponent();
        }

        private void btnLimparFormCad_Click(object sender, EventArgs e)
        {
            txtNome.Text = "";
            txtDn.Text = "";
            txtNIF.Text = "";
            txtLogin.Text = "";
            txtSenha.Text = "";
            txtsenhaConf.Text = "";
        }

        private void btCadastrarLeitor_Click(object sender, EventArgs e)
        {
            //conectar com BD
            /*CASA*/
            //string sConnection = "Initial Catalog = XPTO; Data source = (localdb)\\MSSQLLocalDB; Integrated Security= true;";
            /*ISCTE*/
            string sConnection = "Initial Catalog = XPTO; Data source = DESKTOP-TBLHV1G\\SQLEXPRESS1; Integrated Security= true;";
            System.Data.SqlClient.SqlConnection cn = SQLTools.OpenBD(sConnection);

            SqlCommand cmd = new SqlCommand("Adicionar_Leitor", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nome", txtNome.Text);
            cmd.Parameters.AddWithValue("@NIF", txtDn.Text);
            cmd.Parameters.AddWithValue("@DataNasc", txtNIF.Text);
            cmd.Parameters.AddWithValue("@LeitorLogin", txtLogin.Text);
            if (txtSenha.Text == txtsenhaConf.Text)
            {
                cmd.Parameters.AddWithValue("@LeitorSenha", txtSenha.Text);
            }else
            {
                MessageBox.Show("Senhas não coincidem");
            }

           /*SqlDataAdapter adapter = new SqlDataAdapter(cn);
            DataSet ds = new DataSet();
            adapter.Fill(ds);*/
        }

        private void Cadastro_Load(object sender, EventArgs e)
        {

        }
    }
}
