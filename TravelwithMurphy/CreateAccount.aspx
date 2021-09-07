<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="TravelwithMurphy.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="column-left">

        <asp:GridView ID="UserAccountGV" runat="server"></asp:GridView>

    </section>

    <section id="userInfo" class="column-left">
        <h2>User Account Information</h2>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password:"></asp:Label>
        <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Label ID="lblPhone" runat="server" Text="Phone Number:"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label> 
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>

        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Missing Username" ControlToValidate="txtUsername" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Missing Password" ControlToValidate="txtPassword" Display="None"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ErrorMessage="Missing Password Confirmation" ControlToValidate="txtConfirmPass" Display="None"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvConfirmPass" runat="server" ErrorMessage="Passwords do not match" ControlToValidate="txtConfirmPass" ControlToCompare="txtPassword" Display="None"></asp:CompareValidator>
        <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Invalid Phone Number" ControlToValidate="txtPhone" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="None"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Missing Phone Number" ControlToValidate="txtPhone" Display="None"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Missing Email" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator> 
    </section>
   
    <asp:SqlDataSource ID="UserAccountTable" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:UserAccountCS %>' DeleteCommand="DELETE FROM [UserAccount] WHERE [Id] = @original_Id AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND [Username] = @original_Username AND [Password] = @original_Password AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [UserAccount] ([FirstName], [LastName], [Username], [Password], [Phone], [Email]) VALUES (@FirstName, @LastName, @Username, @Password, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserAccount]" UpdateCommand="UPDATE [UserAccount] SET [FirstName] = @FirstName, [LastName] = @LastName, [Username] = @Username, [Password] = @Password, [Phone] = @Phone, [Email] = @Email WHERE [Id] = @original_Id AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND [Username] = @original_Username AND [Password] = @original_Password AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Username" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
