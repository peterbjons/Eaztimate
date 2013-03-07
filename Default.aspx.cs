using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSupergoo.ABCpdf9;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        XSettings.InstallLicense("e19f8de19f8de19f90e1a0b0e1a0b6e1a0ade1a0b1e1a0b4e1a0b4e1a0b5e1a0a7e1a0b9e1a0bde1a0b0e1a0bb");
        string test="10381222013-01-22fcfyhcHGFCrt5fggfcghfcr645dhgfd";
        byte[] data = new byte[test.Length];
        byte[] result;

        using(SHA1 shaM = new SHA1Managed()) {
            result = shaM.ComputeHash(data);
        }
        //Response.Write(BitConverter.ToString(result));
    }
}