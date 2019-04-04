<!-- Caleb Crownover    Last Worked: 04/04/19 -->
<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>


<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "ccport"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC sp_ins_visitor @nameTextBox, @emailTextBox, @msgTextBox", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text = "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Caleb Portfolio</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/styles.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
</head>

<body>
    <header>
        <h1><mark>Caleb J Crownover</mark></h1>
    </header>
    <!--END HEADER-->

    <nav>
        <ul>
            <li><a href="index.html">Home</a> &nbsp; &nbsp;</li>
            <li><a href="experience.html">Experience</a> &nbsp; &nbsp;</li>
            <li><a href="samples.html">Samples</a> &nbsp; &nbsp;</li>
            <li><a href="about.html">About Me</a> &nbsp; &nbsp;</li>
            <li><a href="contact.html">Contact Me</a> &nbsp; &nbsp;</li>
        </ul>
    </nav>
    <!--END NAVIGATION-->
    <br/><br/>
    <main>
        <h3>You can reach me by:</h3>
        <p><a href="tel:+12084407341">Phone</a>
        <a href="mailto:calebcrownover@mycwi.cc">Email</a></p>
        <hr/>
        <h3>Please complete the form if you would like to get in touch.</h3>
        <form name="form1" runat="server">
            <label for="company">Company:</label>
            <asp:TextBox ID="company" runat="server" />
            <%--<input type="text" id="company" name="company"/>--%><br/><br/>

            <label for="contact">Who to contact:</label>
            <asp:TextBox ID="name" runat="server" />
            <%--<input type="text" id="contact" name="contact"/>--%><br/><br/>

            <label for="email">Email Address:</label>
            <asp:TextBox ID="email" runat="server" />
            <%--<input type="email" id="email" name="email"/>--%><br/><br/>

            <label for="comments">Further information:</label>
            <asp:TextBox ID="message" runat="server" Height="100px" Width="200px" />
            <%--<textarea id="comments" name="comments" rows="3" cols="25"></textarea>--%><br/><br/>

            <asp:Button ID="submit" runat="server" Text="Submit" onclick="submitButton_Click" />
            <%--<input type="submit" id="submit" value="Submit" class="btn"/>--%>
            <input type="reset" id="reset" value="Reset Form" class="btn"/>

            <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

        </form>
    </main>
    <!--END MAIN-->

    <footer>
        <a href="https://www.facebook.com/" target="_blank"><img src="images/facebook.png" alt="facebook logo"/></a>
        <a href="https://www.linkedin.com/" target="_blank"><img src="images/linkedin.png" alt="linkedin logo"/></a>
        <a href="https://github.com/" target="_blank"><img src="images/github.png" alt="github logo"/></a>
        <p>Created by Caleb J Crownover</p>
    </footer>
    <!--END FOOTER-->
</body>
</html>