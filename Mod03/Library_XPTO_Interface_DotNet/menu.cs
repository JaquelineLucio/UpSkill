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
    public partial class menu : Form
    {
        public menu()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //conectar com BD
            /*CASA*/
            //string sConnection = "Initial Catalog = XPTO; Data source = (localdb)\\MSSQLLocalDB; Integrated Security= true;";
            /*ISCTE*/
            string sConnection = "Initial Catalog = XPTO; Data source = DESKTOP-TBLHV1G\\SQLEXPRESS1; Integrated Security= true;";
            
            System.Data.SqlClient.SqlConnection cn = SQLTools.OpenBD(sConnection);

            //DataTable dt = SQLTools.GetDTForSQL(ref cn, "SELECT * FROM [Order Details]");
            String SQL = "SELECT COUNT(ISBN) AS TotalObras FROM Obras";
            DataTable dt = SQLTools.GetDTForSQL(ref cn, SQL);

            //txtTotalObras.Text = (dt.Rows[0]["TotalObras"].ToString());
            gwTotalObrasAssunto.DataSource = dt;
        }

        private void txtTotalObras_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnTotalPorAssunto_Click(object sender, EventArgs e)
        {
            //conectar com BD
            /*CASA*/
            //string sConnection = "Initial Catalog = XPTO; Data source = (localdb)\\MSSQLLocalDB; Integrated Security= true;";
            /*ISCTE*/
            string sConnection = "Initial Catalog = XPTO; Data source = DESKTOP-TBLHV1G\\SQLEXPRESS1; Integrated Security= true;";
            
            System.Data.SqlClient.SqlConnection cn = SQLTools.OpenBD(sConnection);

            //DataTable dt = SQLTools.GetDTForSQL(ref cn, "SELECT * FROM [Order Details]");
            String SQL = "SELECT COUNT(ISBN) AS TotalObras, Assunto FROM Obras GROUP BY Assunto; ";
            DataTable dt = SQLTools.GetDTForSQL(ref cn, SQL);

            gwTotalObrasAssunto.DataSource = dt;

            SQLTools.CloseBD(ref cn);
        }

        private void btnObrasMaisRequisitadas_Click(object sender, EventArgs e)
        {
            //conectar com BD
            /*CASA*/
            // string sConnection = "Initial Catalog = XPTO; Data source = (localdb)\\MSSQLLocalDB; Integrated Security= true;";
            /*ISCTE*/
            string sConnection = "Initial Catalog = XPTO; Data source = DESKTOP-TBLHV1G\\SQLEXPRESS1; Integrated Security= true;";

            System.Data.SqlClient.SqlConnection cn = SQLTools.OpenBD(sConnection);
           
            //DataTable dt = SQLTools.GetDTForSQL(ref cn, "SELECT * FROM [Order Details]");
            String SQL = "SELECT TOP(10) COUNT(Requisicoes.ISBN) AS qtd, Obras.Nome, Obras.Capa FROM Requisicoes INNER JOIN Obras ON Requisicoes.ISBN = Obras.ISBN GROUP BY  Obras.Nome, Obras.Capa ORDER BY COUNT(Requisicoes.ISBN) DESC";
            DataTable dt = SQLTools.GetDTForSQL(ref cn, SQL);

            gwTotalObrasAssunto.DataSource = dt;

            SQLTools.CloseBD(ref cn);
        }

        private void btnNucleos_Click(object sender, EventArgs e)
        {
            //conectar com BD
            /*CASA*/
            //string sConnection = "Initial Catalog = XPTO; Data source = (localdb)\\MSSQLLocalDB; Integrated Security= true;";
            /*ISCTE*/
            string sConnection = "Initial Catalog = XPTO; Data source = DESKTOP-TBLHV1G\\SQLEXPRESS1; Integrated Security= true;";

            System.Data.SqlClient.SqlConnection cn = SQLTools.OpenBD(sConnection);

            //DataTable dt = SQLTools.GetDTForSQL(ref cn, "SELECT * FROM [Order Details]");
            String SQL = "SELECT COUNT(Nucleos.Nome) AS NumRequisicoes, Nucleos.Nome, Nucleos.Cidade FROM Nucleos INNER JOIN Requisicoes ON Nucleos.Id = Requisicoes.NucleoID GROUP BY Nucleos.Nome, Nucleos.Cidade ORDER BY COUNT(Nucleos.Nome) DESC";
            DataTable dt = SQLTools.GetDTForSQL(ref cn, SQL);

            gwTotalObrasAssunto.DataSource = dt;

            SQLTools.CloseBD(ref cn);
        }


        private void menu_Load(object sender, EventArgs e)
        {

        }
    }
}
