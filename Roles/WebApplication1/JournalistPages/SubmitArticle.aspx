<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitArticle.aspx.cs" Inherits="WebApplication1.JournalistPages.SubmitArticle" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>Submit a new article to the Editor</h2>
    </hgroup>
<!-- ARTICLE SUBMISSION FORM -->
    <!-- VALIDATION SUMMARY -->
<asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="There were errors on the page:" />
    <fieldset>
       <legend>Article Submission Form</legend>
        <ol>
            <li>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="ArticleCode">Article Code</asp:Label>
                <asp:TextBox runat="server" ID="ArticleCode" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ArticleCode"
                  CssClass="field-validation-error" ErrorMessage="The article code field is required." />
            </li>
            <li>
                Article Type<br /><asp:DropDownList ID="ArticleType" runat="server">
                <asp:ListItem Value="India">India</asp:ListItem>
	            <asp:ListItem value="World">World</asp:ListItem>
	            <asp:ListItem value="Business">Business</asp:ListItem>
                <asp:ListItem value="Tech">Tech</asp:ListItem>
                <asp:ListItem value="Sports">Sports</asp:ListItem>
                <asp:ListItem value="Entertainment">Entertainment</asp:ListItem>
                <asp:ListItem value="Science">Science</asp:ListItem>
                <asp:ListItem value="Opinion">Opinion</asp:ListItem>
                                  </asp:DropDownList>
            </li>
            <li>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="Location">Location</asp:Label>
                <asp:TextBox runat="server" ID="Location" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Location"
                    CssClass="field-validation-error" ErrorMessage="The location field is required." />
            </li>
            <li>
                Date <br /><asp:Calendar ID="Calendar1" runat="server" SelectionMode="Day"></asp:Calendar>
            </li>
            <li>
                <asp:Label ID="Lable3" runat="server" AssociatedControlID="Headline">Headline</asp:Label>
                <asp:TextBox runat="server" ID="Headline" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Headline"
                    CssClass="field-validation-error" ErrorMessage="The headline field is required." />
            </li>
            <li>
                <asp:Label ID="Label4" runat="server" AssociatedControlID="AuthorID">Author ID</asp:Label>
                <asp:TextBox runat="server" ID="AuthorID" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="AuthorID"
                    CssClass="field-validation-error" ErrorMessage="The Author ID field is required." />
            </li>
            <li>
                <asp:Label ID="Label5" runat="server" AssociatedControlID="WriteUp">Write Up</asp:Label>
                <asp:TextBox ID="WriteUp" TextMode="MultiLine" Columns="75" Rows="10" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="WriteUp"
                    CssClass="field-validation-error" ErrorMessage="The Write Up field is required." />
            </li>
        </ol>
        <asp:Button runat="server" OnClick="Submit_Article" Text="Submit" />
    </fieldset>
</asp:Content>