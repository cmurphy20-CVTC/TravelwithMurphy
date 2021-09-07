<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="TravelwithMurphy.UserProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlNotAuth" runat="server">

        <h2>You are not logged in.</h2>
        <a href="CreateAccount.aspx">Contact Me</a>
    </asp:Panel>


    <asp:Panel ID="pnlUserProfile" runat="server">

        <h2>Welcome <asp:Label ID="lblWelcome" runat="server" Text=""></asp:Label></h2>

        <span id="UL">Username: </span><asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>  
        <br />
        <span>Phone Number: </span><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
        <br />
         <span>Email: </span><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        <br />
        

    </asp:Panel>
</asp:Content>
