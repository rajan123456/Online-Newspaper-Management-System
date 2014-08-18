using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.AdminPages
{
    public partial class AdminReport : System.Web.UI.Page
    {
        //HIDES ALL GRIDVIEWS ON PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
        }

        //GENERATES READERSHIP OR APPROVAL REPORT SELECTION BASED ON TEXT BOX INPUT
        protected void GenerateReport(object sender, EventArgs e)
        {
            if (ReportType.Text == "Readership")
            {
                PopulateApprovedArticles();
            }
            else if (ReportType.Text == "Approval")
            {
                PopulateApprovalReport();
                PopulateRejectReport();
            }
            else
            {
                Label2.Text = "Invalid Report Type";
            }
        }
        //FETCHES APPROVED ARTICLES FROM DATABASE AND BINDS RESULTS WITH GRIDVIEW
        private void PopulateApprovalReport()
        {
            Label1.Visible = false;
            Label2.Visible = true;
            Label2.Text = "Approved Articles By AuthorID";
            ReportTypeButton.Visible = false;
            SqlConnection conn;
            string query = "SELECT COUNT(Status) AS Approve, AuthorID FROM Article_3 WHERE Status=@status Group By AuthorID";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@status", "Approve");
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    GridView2.Visible = true;
                    GridView2.DataSource = reader;
                    GridView2.DataBind();
                }
                else
                {
                    Label2.Text = "No Approved Articles Found";
                }
            }
            
        }
        //FETCHES REJECT ARTICLES FROM DATABASE AND BINDS RESULTS WITH GRIDVIEW
        private void PopulateRejectReport()
        {
            Label3.Text = "Reject Articles By AuthorID";
            SqlConnection conn;
            string query = "SELECT COUNT(Status) AS Reject, AuthorID FROM Article_3 WHERE Status=@status Group By AuthorID";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@status", "Reject");
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    GridView3.Visible = true;
                    GridView3.DataSource = reader;
                    GridView3.DataBind();
                }
                else
                {
                    Label2.Text = "No Rejected Articles Found";
                }
            }
        }
        //POPULATES READERSHIP REPORT FROM DATABASE AND BINDS RESULTS WITH GRIDVIEW
        private void PopulateApprovedArticles()
        {
            Label1.Visible = false;
            Label2.Visible = true;
            Label2.Text = "Approved Articles";
            ReportTypeButton.Visible = false;
            SqlConnection conn;
            string query = "Select Code, AuthorID, Views From Article_3 WHERE Status=@status";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@status", "Approve");
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    GridView1.Visible = true;
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
                else
                {
                    Label2.Text = "No Articles Found";
                }
            }
        }
        //REDIRECT TO HOME ON BUTTON_CLICK
        protected void RedirectToHome(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}