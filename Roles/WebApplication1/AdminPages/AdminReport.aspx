<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminReport.aspx.cs" Inherits="WebApplication1.AdminPages.AdminReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FeaturedContent" runat="server">
      <div>
        <asp:Label ID="Label1" runat="server" AssociatedControlID="ReportType">Enter Report Type
          <asp:TextBox ID="ReportType" runat="server" />
            <ul>
                Valid Reports
                <li>Readership</li>
                <li>Approval</li>
            </ul>
            <!-- VALIDATION OF TEXT BOX -->
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ReportType"
           CssClass ="field-validation-error" ErrorMessage="The report type field is required." /> 
        </asp:Label><asp:Button ID="ReportTypeButton" runat="server" OnClick="GenerateReport" Text="Generate"/>
      </div>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label2" runat="server" />
    <!-- APPROVAL REPORT GRIDVIEW -->
    <asp:GridView ID="GridView1" runat="server" Width="100%" DataKeyNames="Code" CssClass="GridView" AutoGenerateColumns="False" HeaderStyle-BackColor="#7779AF" 
        HeaderStyle-ForeColor="White" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="Both">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" ForeColor="#E7E7FF" Font-Bold="True"></HeaderStyle>
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
        <Columns>
            <asp:BoundField DataField="Code" HeaderText="ArticleCode"/>
            <asp:BoundField DataField="AuthorID" HeaderText="AuthorID"/>
            <asp:BoundField DataField="Views" HeaderText="Views"/>
         </Columns>
    </asp:GridView>
    <!-- APPROVED ARTICLES GRIDVIEW -->
<asp:GridView ID="GridView2" runat="server" Width="100%" CssClass="GridView" AutoGenerateColumns="False" HeaderStyle-BackColor="#7779AF" 
        HeaderStyle-ForeColor="White" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="Both">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" ForeColor="#E7E7FF" Font-Bold="True"></HeaderStyle>
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
        <Columns>
            <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" />
            <asp:TemplateField HeaderText="Approve">
                <ItemTemplate>
                    <%# Eval("Approve") %>
                </ItemTemplate>
            </asp:TemplateField>
         </Columns>
    </asp:GridView>
    <hr />
    <asp:Label ID="Label3" runat="server" />
    <!-- REJECTED ARTICLES GRIDVIEW -->
<asp:GridView ID="GridView3" runat="server" Width="100%" CssClass="GridView" AutoGenerateColumns="False" HeaderStyle-BackColor="#7779AF" 
        HeaderStyle-ForeColor="White" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="Both">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" ForeColor="#E7E7FF" Font-Bold="True"></HeaderStyle>
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
        <Columns>
            <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" />
            <asp:TemplateField HeaderText="Reject">
                <ItemTemplate>
                    <%# Eval("Reject") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
    <asp:Button ID="Home" Text="Home" OnClick="RedirectToHome" runat="server"/>
</asp:Content>


