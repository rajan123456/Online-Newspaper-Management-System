using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.EditorPages
{
    public partial class EditorReview : System.Web.UI.Page
    {
        //FETCHES PENDING ARTICLES ON PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatePendingArticles();
            }
        }
        //REDIRECT TO HOME ON BUTTON CLICK
        protected void RedirectToHome(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
        //FETCHES PENDING ARTICLES FROM DATABASE AND BINDS RESULTS WITH GRIDVIEW
        private void PopulatePendingArticles()
        {
            SqlConnection conn;
            string query = "Select Code, Type, Location, Date, Headline, WriteUp, Status From Article_3 Where Status = @status";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@status", "Pending");
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
                else
                {
                    Label1.Text = "No Articles for Validation";
                    GridView1.Visible = false;
                }
            }
        }
        //GRIDVIEW ROW EDITING EVENT
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }
        //GRIDVIEW ROW CANCELING EVENT
        protected void GridView1_RowCanceling(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            GridView1.EditIndex = -1;
            PopulatePendingArticles();
        }
        //GRIDVIEW ROW UPDATING EVENT
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox txtStatus = (TextBox)row.FindControl("txtStatus");
            string ArticleStatus = txtStatus.Text;
            string ArticleCode = GridView1.DataKeys[e.RowIndex].Value.ToString();
            UpdateArticleStatus(ArticleCode, ArticleStatus);
            GridView1.EditIndex = -1;
            PopulatePendingArticles();
        }
        //UPDATE STATUS OF ARTICLES IF STATUS CHANGED IN GRIDVIEW
        private void UpdateArticleStatus(string code, string status)
        {
            SqlConnection conn;
            string query = "Update Article_3 SET Status=@status WHERE Code=@code";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@code", code);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                System.Threading.Thread.Sleep(500);
            }
        }
    }
}