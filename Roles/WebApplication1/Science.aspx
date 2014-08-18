<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Science.aspx.cs" Inherits="WebApplication1.Science" %>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
                <div id='cssmenu'>
                <ul>
                    <!-- NEWSPAPER CATEGORY PANEL -->
                    <li class='last'><a href='Default.aspx'><span>Home</span></a></li>
                    <li class='last'><a href='India.aspx'><span>India</span></a></li>
                    <li class='last'><a href='World.aspx'><span>World</span></a></li>
                    <li class='last'><a href="Business.aspx"><span>Business</span></a></li>
                    <li class='last'><a href='Tech.aspx'><span>Tech</span></a></li>
                    <li class='last'><a href='Sports.aspx'><span>Sports</span></a></li>
                    <li class='last'><a href='Entertainment.aspx'><span>Entertainment</span></a></li>
                    <li class='active'><a href='#'><span>Science</span></a></li>
                    <li class='last'><a href='Opinion.aspx'><span>Opinion</span></a></li>
                </ul>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" />
    <h3>Science News</h3>
    <!-- APPROVED SCIENCE ARTICLES LISTED HERE -->
    <ol class="round">
        <li class="one">
            <a id="A1" href="#" onServerClick="Article1Head"  runat="server"><asp:Label ID="Label2" runat="server" /></a>
        </li>
        <li class="two">
            <a id="A2" href="#" onServerClick="Article2Head" runat="server"><asp:Label ID="Label3" runat="server" /></a>
        </li>
        <li class="three">
            <a id="A3" href="#" onServerClick="Article3Head" runat="server"><asp:Label ID="Label4" runat="server" /></a>
        </li>
    </ol>
    </asp:Content>
