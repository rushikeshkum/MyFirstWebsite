<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Material.aspx.cs" Inherits="first.Material" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
        <asp:BoundField DataField="UOMid" HeaderText="UOMid" SortExpression="UOMid" />
        <asp:BoundField DataField="GSTid" HeaderText="GSTid" SortExpression="GSTid" />
        <asp:BoundField DataField="HSNCode" HeaderText="HSNCode" SortExpression="HSNCode" />
        <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" />
        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
        <asp:BoundField DataField="CompanyNuame" HeaderText="CompanyNuame" SortExpression="CompanyNuame" />
        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
    </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryConnectionString1 %>" DeleteCommand="DELETE FROM [tblMaterial] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblMaterial] ([Name], [Code], [price], [UOMid], [GSTid], [HSNCode], [CreatedOn], [CreatedBy], [CompanyNuame]) VALUES (@Name, @Code, @price, @UOMid, @GSTid, @HSNCode, @CreatedOn, @CreatedBy, @CompanyNuame)" ProviderName="<%$ ConnectionStrings:InventoryConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [Name], [Code], [price], [UOMid], [GSTid], [HSNCode], [CreatedOn], [CreatedBy], [CompanyNuame] FROM [tblMaterial]" UpdateCommand="UPDATE [tblMaterial] SET [Name] = @Name, [Code] = @Code, [price] = @price, [UOMid] = @UOMid, [GSTid] = @GSTid, [HSNCode] = @HSNCode, [CreatedOn] = @CreatedOn, [CreatedBy] = @CreatedBy, [CompanyNuame] = @CompanyNuame WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Code" Type="String" />
        <asp:Parameter Name="price" Type="Double" />
        <asp:Parameter Name="UOMid" Type="Int32" />
        <asp:Parameter Name="GSTid" Type="Int32" />
        <asp:Parameter Name="HSNCode" Type="String" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedBy" Type="Int32" />
        <asp:Parameter Name="CompanyNuame" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Code" Type="String" />
        <asp:Parameter Name="price" Type="Double" />
        <asp:Parameter Name="UOMid" Type="Int32" />
        <asp:Parameter Name="GSTid" Type="Int32" />
        <asp:Parameter Name="HSNCode" Type="String" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedBy" Type="Int32" />
        <asp:Parameter Name="CompanyNuame" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
