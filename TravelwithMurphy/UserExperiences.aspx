<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserExperiences.aspx.cs" Inherits="TravelwithMurphy.UserExperiences" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <h2>Your Experiences</h2>

    <p>Hey there! Here is a page to save or find ideas for your next trip! I have a few filled in to give you some ideas. Get out there and travel!</p>

    <section class="column-left">

        <asp:GridView ID="UserExperiencesGV" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="UserExperiencesTable">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="ExperienceName" HeaderText="Experience Name" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:BoundField DataField="Description" HeaderText="Decription" />
            </Columns>
        </asp:GridView>
        <h3>Selected Experience</h3>
        <p>
        <asp:DetailsView ID="SelectedExperienceDV" runat="server" Height="50px" Width="378px" AutoGenerateRows="False" DataSourceID="SelectedExperience">
            <Fields>
                <asp:BoundField DataField="ExperienceName" HeaderText="Experience Name" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
            </Fields>
            </asp:DetailsView>
        </p>

        <br />
        <br />
        <h3>Experience Table Interactions</h3>
        <p>
            <asp:FormView ID="ExperiencesFV" runat="server" DataSourceID="UserExperiencesTable" DataKeyNames="Id">
                <EditItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    ExperienceName:
                    <asp:TextBox ID="ExperienceNameTextBox" runat="server" Text='<%# Bind("ExperienceName") %>' />
                    <br />
                    Location:
                    <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    ExperienceName:
                    <asp:TextBox ID="ExperienceNameTextBox" runat="server" Text='<%# Bind("ExperienceName") %>' />
                    <br />
                    Location:
                    <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    ExperienceName:
                    <asp:Label ID="ExperienceNameLabel" runat="server" Text='<%# Bind("ExperienceName") %>' />
                    <br />
                    Location:
                    <asp:Label ID="LocationLabel" runat="server" Text='<%# Bind("Location") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>


        </p>

    </section>

    <asp:SqlDataSource ID="UserExperiencesTable" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:UserAccountCS %>" DeleteCommand="DELETE FROM [UserExperiences] WHERE [Id] = @original_Id AND (([ExperienceName] = @original_ExperienceName) OR ([ExperienceName] IS NULL AND @original_ExperienceName IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [UserExperiences] ([ExperienceName], [Location], [Description]) VALUES (@ExperienceName, @Location, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UserExperiences]" UpdateCommand="UPDATE [UserExperiences] SET [ExperienceName] = @ExperienceName, [Location] = @Location, [Description] = @Description WHERE [Id] = @original_Id AND (([ExperienceName] = @original_ExperienceName) OR ([ExperienceName] IS NULL AND @original_ExperienceName IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_ExperienceName" Type="String" />
            <asp:Parameter Name="original_Location" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ExperienceName" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExperienceName" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_ExperienceName" Type="String" />
            <asp:Parameter Name="original_Location" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SelectedExperience" runat="server" ConnectionString="<%$ ConnectionStrings:UserAccountCS %>" SelectCommand="SELECT * FROM [UserExperiences] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="UserExperiencesGV" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
