using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class World : System.Web.UI.Page
    {   //FETCH APPROVED WORLD ARTICLES ON PAGE LOAD
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchArticleByType();
        }
        //FETCH APPROVED WORLD ARTICLES FROM DATABASE
        private void FetchArticleByType()
        {
            SqlConnection conn;
            string[] Headline = new string[3];
            string query = "Select Top 3 Headline From Article_3 WHERE Type=@type AND Status=@approve";
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@type", "World");
                cmd.Parameters.AddWithValue("@approve", "Approve");
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    int i = 0;
                    while (reader.Read())
                    {
                        if (String.Compare(reader.GetValue(0).ToString(), null, false) != 0)
                        {
                            Headline[i] = reader.GetValue(0).ToString();
                            i++;
                        }
                        else
                        {
                            Headline[i] = null;
                            i++;
                        }
                    }
                    PopulateArticleLinks(Headline[0], Headline[1], Headline[2]);
                }
                else
                {
                    Label1.Text = "No articles posted yet!";
                }
                conn.Close();
            }
        }
        //DISPLAY FETCHED ARTICLES ON PAGE
        private void PopulateArticleLinks(string Headline1, string Headline2, string Headline3)
        {
            if (Headline1 != null)
            {
                Label2.Text = Headline1;
            }
            else
            {
                Label2.Visible = false;
            }
            if (Headline2 != null)
            {
                Label3.Text = Headline2;
            }
            else
            {
                Label3.Visible = false;
            }
            if (Headline3 != null)
            {
                Label4.Text = Headline3;
            }
            else
            {
                Label4.Visible = false;
            }
        }
        //STORE HEADLINE IN SESSION OBJECT
        protected void Article1Head(object sender, EventArgs e)
        {
            string Headline1 = Label2.Text;
            Session["Headline"] = Headline1;
            Response.Redirect("ArticleRead.aspx");
        }
        //STORE HEADLINE IN SESSION OBJECT
        protected void Article2Head(object sender, EventArgs e)
        {
            string Headline1 = Label3.Text;
            Session["Headline"] = Headline1;
            Response.Redirect("ArticleRead.aspx");
        }
        //STORE HEADLINE IN SESSION OBJECT
        protected void Article3Head(object sender, EventArgs e)
        {
            string Headline1 = Label4.Text;
            Session["Headline"] = Headline1;
            Response.Redirect("ArticleRead.aspx");
        }
    }
}