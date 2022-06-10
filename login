using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace loginN
{
    public partial class login : Form
    {
        private object cmd;

        public SqlConnection Conexion { get; private set; }

        public login()
        {
            InitializeComponent();
        }

         private void logins()
        {
            try
            {
                string cnn = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
                using (SqlConnection conexion = new SqlConnection(cnn))
                    
                    {
                    conexion.Open();
                    using (SqlCommand cmd = new SqlCommand("select usuario, pass From usuarios where usuario´" + txtuser.Text + "´ and pass= ´" + txtcontraseña.Text + "´", Conexion)) 
                    {
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read())
                        {
                            MessageBox.Show("login exitoso");

                        }
                        else
                        {
                            MessageBox.Show("datos incorrectos");
                        }
            }
            }
            }
            catch (Exception ex)
    
            {
                MessageBox.Show(ex.ToString());
                
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void Button2_click(object sender, EventArgs e)
        {
            logins();
        }

        private void ingresar_Click(object sender, EventArgs e)
        {
            logins();
        }

        private void login_Load(object sender, EventArgs e)
        {

        }
    }
}

