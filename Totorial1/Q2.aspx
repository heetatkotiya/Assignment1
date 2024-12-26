<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Temperature Conversion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }

        .label {
            font-size: 1.2em;
            color: #555;
            margin-right: 10px;
        }

        .textbox, .radio-buttons, .button {
            font-size: 1.2em;
            padding: 10px;
            margin: 10px 0;
            width: 80%;
            max-width: 350px;
        }

        .radio-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .button {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .result {
            font-size: 1.3em;
            color: #007BFF;
            margin-top: 20px;
        }

        .error {
            font-size: 1.3em;
            color: red;
            margin-top: 20px;
        }

        .radio-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Temperature Conversion</h1>

            <!-- Input for Temperature -->
            <asp:Label ID="lblTemperature" runat="server" CssClass="label" Text="Enter Temperature: " />
            <asp:TextBox ID="txtTemperature" runat="server" CssClass="textbox" placeholder="Enter temperature here"></asp:TextBox><br />

            <!-- Radio Buttons for Conversion Type -->
            <div class="radio-container">
                <asp:Label ID="lblConvertTo" runat="server" CssClass="label" Text="Convert To: " />
                <asp:RadioButtonList ID="rblConversionType" runat="server" RepeatDirection="Horizontal" CssClass="radio-buttons">
                    <asp:ListItem Value="Celsius" Text="Celsius" />
                    <asp:ListItem Value="Fahrenheit" Text="Fahrenheit" />
                </asp:RadioButtonList>
            </div><br />

            <!-- Convert Button -->
            <asp:Button ID="btnConvert" runat="server" CssClass="button" Text="Convert" OnClick="btnConvert_Click" /><br />

            <!-- Display Result -->
            <asp:Label ID="lblResult" runat="server" CssClass="result"></asp:Label>

            <!-- Display Error Message -->
            <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
        </div>
    </form>

    <script runat="server">
        protected void btnConvert_Click(object sender, EventArgs e)
        {
            lblResult.Text = string.Empty; // Reset result label
            lblError.Text = string.Empty;  // Reset error label

            try
            {
                // Parse the input temperature
                double temperature = double.Parse(txtTemperature.Text);

                // Get the selected conversion type
                string conversionType = rblConversionType.SelectedValue;
                double convertedTemperature;

                if (conversionType == "Celsius")
                {
                    // Fahrenheit to Celsius conversion
                    convertedTemperature = (temperature - 32) * 5 / 9;
                    lblResult.Text = $"{temperature} °F = {convertedTemperature:F2} °C";
                }
                else if (conversionType == "Fahrenheit")
                {
                    // Celsius to Fahrenheit conversion
                    convertedTemperature = (temperature * 9 / 5) + 32;
                    lblResult.Text = $"{temperature} °C = {convertedTemperature:F2} °F";
                }
                else
                {
                    lblError.Text = "Please select a valid conversion type.";
                }
            }
            catch (FormatException)
            {
                lblError.Text = "Please enter a valid numeric temperature.";
            }
        }
    </script>
</body>
</html>
