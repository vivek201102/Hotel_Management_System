using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace HotelMS.Models
{
    public class Functions
    {
        private SqlConnection Con;
        private SqlCommand Cmd;
        private DataTable dt;
        private string ConStr;
        private SqlDataAdapter sda;

        public int setData(string Query)
        {
            int Cnt;
            if(Con.State==ConnectionState.Closed)
            {
                Con.Open();
            }
            Cmd.CommandText = Query;
            Cnt = Cmd.ExecuteNonQuery();
            Con.Close();
            return Cnt;
        }

        public DataTable GetData(string Query)
        {
            try
            {
                dt = new DataTable();
                sda = new SqlDataAdapter(Query, ConStr);
                sda.Fill(dt);
            }

            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
            return dt;
        }

        public Functions()
        {
            ConStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\vivek\Desktop\HotelMS\HotelMS\App_Data\Database1.mdf;Integrated Security=True";
            Con = new SqlConnection(ConStr);
            Cmd = new SqlCommand();
            Cmd.Connection = Con;
        }
    }
}