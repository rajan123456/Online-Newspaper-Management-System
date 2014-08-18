<%@ Page Title="The First Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
                <div id='cssmenu'>
                <ul>
                    <!-- NEWSPAPER CATEGORY PANE -->
                    <li class='active'><a href='#'><span>Home</span></a></li>
                    <li class='last'><a href='India.aspx'><span>India</span></a></li>
                    <li class='last'><a href='World.aspx'><span>World</span></a></li>
                    <li class='last'><a href='Business.aspx'><span>Business</span></a></li>
                    <li class='last'><a href='Tech.aspx'><span>Tech</span></a></li>
                    <li class='last'><a href='Sports.aspx'><span>Sports</span></a></li>
                    <li class='last'><a href='Entertainment.aspx'><span>Entertainment</span></a></li>
                    <li class='last'><a href='Science.aspx'><span>Science</span></a></li>
                    <li class='last'><a href='Opinion.aspx'><span>Opinion</span></a></li>
                </ul>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Latest News</h3>
    Click on the tabs to find news articles.
</asp:Content>
