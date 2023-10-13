<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="first.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card-body">         
    
    <label class="form-label">Enter Username </label>
           <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" placeholder="Id" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
<br />

           <label class="form-label">Enter Password</label>

           <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" placeholder="Password" />
           <asp:RequiredFieldValidator ErrorMessage="Required  Password" ControlToValidate="txtPassword" runat="server" SetFocusOnError="true" ForeColor="Red"  /><br />

        </div>  

     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="LogIn" />
    <asp:Label Text="" ID="lblStetus" runat="server" />

</asp:Content>
