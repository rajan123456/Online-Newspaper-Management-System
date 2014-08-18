using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.JournalistPages
{
    public partial class SubmitArticle : System.Web.UI.Page
    {
        //PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //SAVE SUBMITTED ARTICLE TO DATABASE ON BUTTON CLICK
        protected void Submit_Article(object sender, EventArgs e)
        {
            string date = Calendar1.SelectedDate.ToShortDateString();
            AddArticleToDB(ArticleCode.Text, ArticleType.SelectedItem.Text, Location.Text, date, Headline.Text, AuthorID.Text, WriteUp.Text);
        }
        //INSERT NEW ROW INTO ARTICLE TABLE
        private void AddArticleToDB(string articlecode, string articletype, string location, string date, string headline, string authorid, string writeup)
        {
            SqlConnection conn;
            string query = "INSERT INTO Article_3 (Code, Type, Location, Date, Headline, AuthorID, WriteUp, Status, Views) VALUES (@code, @type, @location, @date, @headline, @authorid, @writeup, @status, @views)";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@code", articlecode);
                cmd.Parameters.AddWithValue("@type", articletype);
                cmd.Parameters.AddWithValue("@location", location);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@headline", headline);
                cmd.Parameters.AddWithValue("@authorid", authorid);
                cmd.Parameters.AddWithValue("@writeup", writeup);
                cmd.Parameters.AddWithValue("@status", "Pending");
                cmd.Parameters.AddWithValue("@views", 0);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                System.Threading.Thread.Sleep(500);
                Response.Redirect("~/");
            }        
        }
    }
}