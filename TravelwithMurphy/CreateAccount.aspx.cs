using System;
using TravelwithMurphy.model;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelwithMurphy
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // TODO submit to database
            Boolean isUniqueName = true;

            DataSourceSelectArguments arguements = new DataSourceSelectArguments();
            foreach (DataRowView view in UserAccountTable.Select(arguements))
            {
                if (view.Row["Username"].Equals(txtUsername.Text.Trim()))
                {
                    isUniqueName = false;
                }
            }

            if (isUniqueName)
            {

                // create and populate a user account object
                model.UserAccount account = new UserAccount();

                account.FirstName = txtFirstName.Text.Trim();
                account.LastName = txtLastName.Text.Trim();
                account.Username = txtUsername.Text.Trim();

                byte[] data = System.Text.Encoding.ASCII.GetBytes(txtPassword.Text.Trim());
                data = new System.Security.Cryptography.SHA256Managed().ComputeHash(data);
                String hashedPassword = System.Text.Encoding.ASCII.GetString(data);

                account.Password = hashedPassword;

                account.Phone = txtPhone.Text.Trim();
                account.Email = txtEmail.Text.Trim();

                // TODO add the new user account to the database
                UserAccountTable.InsertParameters["FirstName"].DefaultValue = account.FirstName;
                UserAccountTable.InsertParameters["LastName"].DefaultValue = account.LastName;
                UserAccountTable.InsertParameters["Username"].DefaultValue = account.Username;
                UserAccountTable.InsertParameters["Password"].DefaultValue = account.Password;
                UserAccountTable.InsertParameters["Phone"].DefaultValue = account.Phone;
                UserAccountTable.InsertParameters["Email"].DefaultValue = account.Email;

                UserAccountTable.Insert();

                // add the account to session 
                Session.Add("AuthenticatedUser", account);

                // redirect the authenitcated to a user profile page
                Response.Redirect("UserProfile.aspx");
            }
            else
            {
                //username is not unique
                Response.Redirect("CreateAccount.aspx");
            }
        }
    }
}