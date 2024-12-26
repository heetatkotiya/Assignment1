<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; margin-top: 50px;">
            <h1>Welcome Page</h1>
            <asp:Label ID="lblName" runat="server" Text="Enter Your Name:" />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br /><br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br /><br />

            <asp:Label ID="lblWelcomeMessage" runat="server" Text="" ForeColor="Blue"></asp:Label>
        </div>
    </form>

    <script runat="server">
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userName = txtName.Text.Trim();

            if (!string.IsNullOrEmpty(userName))
            {
                lblWelcomeMessage.Text = $"Welcome, {userName}!";
            }
            else
            {
                lblWelcomeMessage.Text = "Please enter your name.";
            }
        }
    </script>
</body>
</html>