using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Security
/// </summary>
public static class Security
{
    public static string SHA1(string str) {

        Encoding enc = Encoding.GetEncoding("iso-8859-1");

        using (SHA1Managed sha1 = new SHA1Managed())
        {
            byte[] hash = sha1.ComputeHash(enc.GetBytes(str));
            StringBuilder formatted = new StringBuilder(2 * hash.Length);
            foreach (byte b in hash)
            {
                formatted.AppendFormat("{0:X2}", b);
            }
            return formatted.ToString();
        }
    }
}