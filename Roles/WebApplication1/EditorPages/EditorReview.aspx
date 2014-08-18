<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireUp="true" CodeBehind="EditorReview.aspx.cs" Inherits="WebApplication1.EditorPages.EditorReview" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>View Pending Articles</h2>
    </hgroup>

    <asp:Label ID="Label1" runat="server"></asp:Label><br />
    <!-- GRIDVIEW TO DISPLAY ARTICLES WITH PENDING STATUS FOR APPROVAL -->
    <asp:GridView ID="GridView1" runat="server" Width="100%" DataKeyNames="Code" CssClass="GridView" AutoGenerateColumns="False" HeaderStyle-BackColor="#7779AF" 
        HeaderStyle-ForeColor="White" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="Both"
        OnRowCancelingEdit="GridView1_RowCanceling" OnRowEditing="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating">
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
        <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowCancelButton="true" />
        <asp:BoundField DataField="Code" HeaderText="ArticleCode" ReadOnly="true"/>
        <asp:BoundField DataField="Type" HeaderText="ArticleType" ReadOnly="true"/>
        <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="true"/>
        <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="true"/>
        <asp:BoundField DataField="Headline" HeaderText="Headline" ReadOnly="true"/>
        <asp:BoundField DataField="Writeup" HeaderText="WriteUp" ReadOnly="true"/>
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <%# Eval("Status") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox runat="server" ID="txtStatus" Text='<%# Eval("Status") %>'/>
            </EditItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Home" Text="Home" runat="server" OnClick="RedirectToHome" />
</asp:Content>