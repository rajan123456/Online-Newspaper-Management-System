<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %> Us</h1>
        
    </hgroup>
    <!--CONTACT DETAILS -->
    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            <span>+91 822 015 4542</span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            <span><a href="mailto:rajan.gupta2011@vit.ac.in">rajan.gupta2011@vit.ac.in</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            G - 628, Men's Hostel <br />
            VIT University, Vellore<br />
            Tamil Nadu, India - 632014
        </p>
    </section>
</asp:Content>