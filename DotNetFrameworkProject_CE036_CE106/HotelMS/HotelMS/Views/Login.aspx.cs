using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelMS.Views
{
    public partial class Login : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            Session["username"] = "";
            Session["uid"] = "";
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            if (AdminCb.Checked)
            {
                if(UserTb.Value == "admin" && PasswordTb.Value == "password")
                {
                    Session["username"] = "admin";
                    Session["uid"] = "-1";
                    Response.Redirect("Admin/Rooms.aspx");
                }
                else
                {
                    errMsg.InnerText = "Invalid Admin";
                }
            }

            else
            {
                string query = "select UId, UName, UPass from UserTbl where UName = '{0}' and UPass = '{1}'";
                query = string.Format(query, UserTb.Value, PasswordTb.Value);
                DataTable dt = Con.GetData(query);

                if(dt.Rows.Count == 0)
                {
                    errMsg.InnerText = "Invalid User!!!";
                    
                }
                else
                {
                    Session["username"] = dt.Rows[0][1].ToString();
                    Session["uid"] = Convert.ToInt32(dt.Rows[0][0].ToString());
                    Response.Redirect("Users/Booking.aspx");
                }
            }

        }
    }
}