using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelMS.Views.Users
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            ShowRooms();
            ShowBooking();
        }

        public void ShowRooms()
        {
            string Query = "select RId as Id, RName as Name, RCategory as Category, RCost as Cost, RRemarks as Remark, Status from RoomTbl where Status = 'Available'";
            RoomsGV.DataSource = Con.GetData(Query);
            RoomsGV.DataBind();
        }

        public void ShowBooking()
        {
            string Query = "select * from BookingTbl";
            BookingGV.DataSource = Con.GetData(Query);
            BookingGV.DataBind();
        }

        int Key = 0;
        int Days = 1;

        protected void RoomsGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            Key = Convert.ToInt32(RoomsGV.SelectedRow.Cells[1].Text);
            RoomTb.Value = RoomsGV.SelectedRow.Cells[2].Text;
            int Cost = Days * Convert.ToInt32(RoomsGV.SelectedRow.Cells[4].Text);
            AmountTb.Value = Cost.ToString();
        }

        int TCost;
        private void GetCost()
        {
            DateTime DIn = Convert.ToDateTime(DateInTb.Value);
            DateTime DOut = Convert.ToDateTime(DateOutTb.Value);
            TimeSpan value = DOut.Subtract(DIn);
            TCost = Convert.ToInt32(value.ToString().Substring(0,2)) * Convert.ToInt32(RoomsGV.SelectedRow.Cells[4].Text);
            AmountTb.Value = TCost.ToString();
            
        }

        protected void BoookBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if(Convert.ToDateTime(DateInTb.Value)> Convert.ToDateTime(DateOutTb.Value))
                {
                    errMsg.InnerText = "Check out must be after than check in";
                }
                else if(Convert.ToDateTime(DateInTb.Value) < System.DateTime.Today.Date)
                {
                    errMsg.InnerText = "Check in can not be done in past";
                }
                else
                {
                    string RId = RoomsGV.SelectedRow.Cells[1].Text;
                    string BDate = System.DateTime.Today.Date.ToString("yyyy-MM-dd");
                    Response.Write(BDate);
                    string InDate = DateInTb.Value;
                    Response.Write(InDate);
                    string OutDate = DateOutTb.Value;
                    Response.Write(OutDate);
                    string Agent = Session["uid"] as String;
                    int Amount = Convert.ToInt32(AmountTb.Value.ToString());

                    string Query = "insert into BookingTbl values('{0}','{1}','{2}','{3}','{4}','{5}')";
                    Query = string.Format(Query, BDate, RId, Agent, InDate, OutDate, Amount);
                    Con.setData(Query);

                    Query = "update RoomTbl set status = 'Booked' where RId = '{0}'";
                    Query = string.Format(Query, RId);
                    Con.setData(Query);
                    ShowRooms();
                    ShowBooking();
                    errMsg.InnerText = "Room  Booked!!!";
                }
            }
            catch (Exception Ex)
            {
                errMsg.InnerText = Ex.Message;
            }
        }

        protected void BookingGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            RoomTb.Value = BookingGV.SelectedRow.Cells[1].Text;
            DateInTb.Value = BookingGV.SelectedRow.Cells[2].Text;
            Response.Write(BookingGV.SelectedRow.Cells[2].Text);
            DateOutTb.Value = BookingGV.SelectedRow.Cells[3].Text;
            AmountTb.Value = BookingGV.SelectedRow.Cells[4].Text;
            
                /*
            string RId = RoomsGV.SelectedRow.Cells[1].Text;
            string query = "update RoomTbl set status = 'Availiable' where RId = '{0}'";
            query = string.Format(query, RId);
            Con.setData(query);
            

            string BId = BookingGV.SelectedRow.Cells[1].Text;
            query = "delete from BookingTbl where BId = '{0}'";
            query = string.Format(query, BId);
            Con.setData(query);
            ShowRooms();
            ShowBooking();
                */
        }
    }
}