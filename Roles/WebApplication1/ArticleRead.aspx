<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleRead.aspx.cs" Inherits="WebApplication1.ArticleRead" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HEADLINE LABEL -->
    <asp:Label ID="HeadlineLabel" runat="server" Font-Size="X-Large" Font-Bold="true" />
    <hr />
    <!-- BYLINE LABEL -->
    <asp:Label ID="ByLabel" runat="server" />
    <hr />
    <!-- ARTICLE CONTENT LABEL -->
    <asp:Label ID="WriteLabel" runat="server" Width="100%" />
    <hr />
    <!-- COMMENT LABEL -->
    <asp:Label ID="CommentLabel" runat="server" Width="80%" />
    <!-- COMMENT TEXT BOX -->
    <asp:TextBox ID="txtComment" runat="server" Visible="false" />
    <!-- TEXT BOX VALIDATION -->
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtComment"
      CssClass="field-validation-error" ErrorMessage="The comment field is required." />
    <!-- SUBMIT BUTTON -->
    <asp:Button ID="PostCommentButton" Text="Post" runat="server" OnClick="PostComment" Visible="false" />
    <asp:Label ID="Label1" runat="server" Visible="false" />
</asp:Content>
