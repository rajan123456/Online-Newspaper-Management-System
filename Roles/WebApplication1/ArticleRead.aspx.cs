using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class ArticleRead : System.Web.UI.Page
    {   //DISPLAY ARTICLE ON PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayArticleContent(sender, e);
        }
        //RETREIVE ARTICLE HEADLINE PASSED INTO SESSION OBJECT BY CALLING PAGE
        private void DisplayArticleContent(object sender, EventArgs e)
        {
            string Headline = (string)(Session.Contents[0]);
            FetchArticleByHeadline(Headline);
        }
        //GET ARTICLE BY SEARCHING WITH HEADLINE
        private void FetchArticleByHeadline(string Headline)
        {
            SqlConnection conn;
            string query = "SELECT Code, Location, Date, WriteUp From Article_3 WHERE Headline=@headline";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@headline", Headline);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string Location = (string)reader["Location"];
                    string Date = (string)reader["Date"];
                    string WriteUp = (string)reader.GetString(3);
                    string Code = (string)reader["Code"];
                    DisplayLabelFields(Headline, Location, Date, WriteUp);
                    UpdateArticleViews(Code);
                    ArticleComments(Code);
                }
                conn.Close();
            }
        }
        //DISPLAY CONTENT INTO LABEL FIELDS
        private void DisplayLabelFields(string Headline, string Location, string Date, string WriteUp)
        {
            HeadlineLabel.Text = Headline;
            ByLabel.Text = Date + " - " + Location + ".";
            WriteLabel.Text = WriteUp;
        }
        //FIND ARTICLE BY CODE
        private void UpdateArticleViews(string Code)
        {
            SqlConnection conn;
            string query = "SELECT Views From Article_3 WHERE Code=@code";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@code", Code);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ViewCount = (int)reader["Views"];
                    IncrementView(Code, ViewCount);
                }
                conn.Close();
            }
        }
        //INCREMENT VIEWS OF ARTICLE BY 1
        private void IncrementView(string Code, int Views)
        {
            SqlConnection conn;
            string query2 = "UPDATE Article_3 SET Views=@views WHERE Code=@code";
            Views++;
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query2, conn);
                cmd.Parameters.AddWithValue("@views", Views);
                cmd.Parameters.AddWithValue("@code", Code);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        //MAKE COMMENT FACILITY AVAILABLE IF USER IS LOGGED IN
        private void ArticleComments(string Code)
        {
            if (User.Identity.Name != "")
            {
                CommentLabel.Text = "Post a comment";
                txtComment.Visible = true;
                PostCommentButton.Visible = true;
                Session["Code"] = Code;
            }
        }
        //STORE COMMENT IN DATABASE
        protected void PostComment(object sender, EventArgs e)
        {
            string Code = (string)(Session.Contents[1]);
            string ReaderID = User.Identity.Name;
            SqlConnection conn;
            string query = "INSERT INTO CommentTable VALUES(@code, @readername, @comment)";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@code", Code);
                cmd.Parameters.AddWithValue("@readername", ReaderID);
                cmd.Parameters.AddWithValue("@comment", txtComment.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            CommentLabel.Visible = false;
            txtComment.Visible = false;
            PostCommentButton.Visible = false;
            Label1.Visible = true;
            Label1.Text = "Comment Posted";
        }
    }
}