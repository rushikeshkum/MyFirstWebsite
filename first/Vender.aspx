<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Vender.aspx.cs" Inherits="first.Vender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="" style="direction:rtl">
    
         <asp:Button Text="Logout" CssClass="btn btn-primary"  runat="server" OnClick="Unnamed1_Click1" />


 </div>
    <div class="row">
        <div class="col-4 form">

            <label class="form-label">Username:</label>
            <asp:TextBox runat="server" ID="txtUser" CssClass="form-control" />
            <br />

            <label class="form-label">Enter ID </label>
            <asp:TextBox runat="server" ID="txtId" CssClass="form-control" TextMode="Number" placeholder="Id" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtId" ErrorMessage="Id is requid" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
 <br />

            <label class="form-label">Enter Name</label>

            <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Full Name" />
            <asp:RequiredFieldValidator ErrorMessage="Required Name" ControlToValidate="txtName" runat="server" SetFocusOnError="true" ForeColor="Red" /><br />

            <label class="form-label">Enter Address </label>
            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" TextMode="MultiLine" placeholder="Address" />
            <asp:RequiredFieldValidator ErrorMessage="Required Address" ControlToValidate="txtAddress" runat="server" SetFocusOnError="true" ForeColor="Red" /><br />

            <label class="form-label">Enter Email </label>
            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" placeholder="Email" />
            <asp:RequiredFieldValidator ErrorMessage="Required Email" ControlToValidate="txtEmail" runat="server" SetFocusOnError="true" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email format is Wrong" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />

            <label class="form-label">Enter Mobile </label>
            <asp:TextBox runat="server" ID="TxtMobileno" CssClass="form-control" placeholder="Mobiel No" />
            <asp:RequiredFieldValidator ErrorMessage="Required Mobile Number" ControlToValidate="txtMobileno" runat="server" SetFocusOnError="true" ForeColor="Red" /><br />

            <label class="form-label">Is Active </label>
            <asp:DropDownList runat="server" ID="cmbActive" CssClass="form-control">
                <asp:ListItem Text="Yes" Value="1" />
                <asp:ListItem Text="No" Value="0" />
            </asp:DropDownList>

            <label class="form-label">Brous Photo </label>
            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />

            <br />
            <asp:Button Text="Save" ID="btnSave" runat="server" CssClass=" btn btn-success mt-2" OnClick="btnSave_Click" />

            <asp:Button Text="Delete" ID="btnDelete" runat="server" CssClass=" btn btn-danger mt-2" OnClick="btnDelete_Click" />

            <div class="">

                <asp:Label Text="" ForeColor-="red" runat="server" ID="lblStatus" />

            </div>


        </div>


        <div class="col-8">

            <asp:GridView ID="venderGrid" runat="server" CssClass="table table-bordered" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" OnSelectedIndexChanged="venderGrid_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:ImageField DataAlternateTextField="Photo" DataAlternateTextFormatString="Photo" DataImageUrlField="Photo">
                    </asp:ImageField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />


            </asp:GridView>

        </div>

    </div>
</asp:Content>

