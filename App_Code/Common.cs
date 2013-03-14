using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Common
/// </summary>
public static class Common
{
    public static bool Mail(string fromName, string fromAddress, string toAddress, string subject, string body) {
        try {
            MailMessage message = new MailMessage(new MailAddress(fromAddress, fromName), new MailAddress(toAddress));
            message.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = false;

            int port = 0;
            int.TryParse(ConfigurationManager.AppSettings["SMTPPort"], out port);
            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["SMTPServer"], port);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["AutomatedEMailAddress"], ConfigurationManager.AppSettings["SMTPPassword"]);
            //client.Credentials = CredentialCache.DefaultNetworkCredentials;
            client.Send(message);
            return true;
        } catch (Exception ex) {
            ex.ToString();
            return false;
        }
    }

    public static bool PdfMail(Stream stream, string toAddress) {
        try {
            MailMessage message = new MailMessage(new MailAddress("noreply@digitalyard.se", "Eaztimate Jour"), new MailAddress(toAddress));
            message.BodyEncoding = Encoding.GetEncoding("ISO-8859-1");
            message.Subject = "Jourrapport";
            message.Body = "Här kommer en jourrapport\r\n";
            stream.Seek(0, SeekOrigin.Begin);
            Attachment att = new Attachment(stream, MediaTypeNames.Application.Pdf);
            att.ContentDisposition.FileName = "Jourrapport.pdf";
            message.Attachments.Add(att);
            message.IsBodyHtml = false;

            int port = 0;
            int.TryParse(ConfigurationManager.AppSettings["SMTPPort"], out port);
            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["SMTPServer"], port);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["AutomatedEMailAddress"], ConfigurationManager.AppSettings["SMTPPassword"]);
            //client.Credentials = CredentialCache.DefaultNetworkCredentials;
            client.Send(message);
            return true;
        } catch (Exception ex) {
            ex.ToString();
            return false;
        }
    }
}