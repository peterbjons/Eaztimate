using System;
using System.Collections.Generic;
using Conf = System.Configuration.ConfigurationManager;
using System.Linq;
using System.Web;
using Amazon.S3;
using Amazon.S3.Model;
using System.IO;

/// <summary>
/// Summary description for AmazonHandler
/// </summary>
public static class AmazonHandler
{
    public static string GetPrivateImage(string filename) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["bucket"])
                .WithKey(filename)
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
           return client.GetPreSignedURL(request);
        }
    }

    public static string GetPrivateImageOcab(string filename) {
        string accessKeyID = Conf.AppSettings["AWSAccessKeyOcab"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKeyOcab"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["BucketJobb"])
                .WithKey(filename)
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
            return client.GetPreSignedURL(request);
        }
    }

    public static string GetPrivateImageJour(string filename) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["bucketJour"])
                .WithKey(filename)
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
            return client.GetPreSignedURL(request);
        }
    }

    public static string GetPrivateImageKlotter(string filename) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["bucketKlotter"])
                .WithKey(filename)
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
            return client.GetPreSignedURL(request);
        }
    }

    public static bool PutPdfJour(MemoryStream ms, String filename) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];        
        try {
            using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
                PutObjectRequest request = new PutObjectRequest();
                //DirectoryInfo di = new DirectoryInfo(m_filePath + fileThumbs + @"\" + i[0].ToString());                    
                //m_eventLog.WriteEntry("Uploading " + m_filePath + fileType + @"\" + i[0].ToString() + ext, EventLogEntryType.Information);
                request.WithBucketName(Conf.AppSettings["bucketJour"]).WithKey(filename + "/report.pdf").WithTimeout(600000).WithInputStream(ms);
                using (S3Response response = client.PutObject(request)) { }
                using (Eaztimate.SQL.ExecuteQuery("UPDATE jour SET pdf_synced=1 WHERE journo=@1", filename)) { }
                return true;
            }
        } catch (AmazonS3Exception amazonS3Exception) {
            if (amazonS3Exception.ErrorCode != null &&
                (amazonS3Exception.ErrorCode.Equals("InvalidAccessKeyId") ||
                amazonS3Exception.ErrorCode.Equals("InvalidSecurity"))) {
                    return false;
            } else {
                return false;
            }
        }        
    }

    public static string GetPdfJour(string jourid) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["bucketJour"])
                .WithKey(jourid+"/report.pdf")
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
            return client.GetPreSignedURL(request);
        }
    }

    public static bool PutPdfKlotter(MemoryStream ms, String filename, int type) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        try {
            using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
                PutObjectRequest request = new PutObjectRequest();
                //DirectoryInfo di = new DirectoryInfo(m_filePath + fileThumbs + @"\" + i[0].ToString());                    
                //m_eventLog.WriteEntry("Uploading " + m_filePath + fileType + @"\" + i[0].ToString() + ext, EventLogEntryType.Information);
                request.WithBucketName(Conf.AppSettings["bucketKlotter"]).WithKey(filename + "/report" + (type == 0 ? "" : "-police") + ".pdf").WithTimeout(600000).WithInputStream(ms);
                using (S3Response response = client.PutObject(request)) { }
                using (Eaztimate.SQL.ExecuteQuery("UPDATE klotter SET pdf_synced=1 WHERE klotterno=@1", filename)) { }
                return true;
            }
        } catch (AmazonS3Exception amazonS3Exception) {
            if (amazonS3Exception.ErrorCode != null &&
                (amazonS3Exception.ErrorCode.Equals("InvalidAccessKeyId") ||
                amazonS3Exception.ErrorCode.Equals("InvalidSecurity"))) {
                return false;
            } else {
                return false;
            }
        }
    }

    public static string GetPdfKotter(string klotterid) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["bucketKlotter"])
                .WithKey(klotterid + "/report.pdf")
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
            return client.GetPreSignedURL(request);
        }
    }

    public static bool PutACRALog(String data, String filename) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        try {
            using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
                PutObjectRequest request = new PutObjectRequest();                
                request.WithBucketName(Conf.AppSettings["BucketLog"]).WithKey(filename + ".json").WithTimeout(600000).WithContentBody(data);
                using (S3Response response = client.PutObject(request)) { }                
                return true;
            }
        } catch (AmazonS3Exception amazonS3Exception) {
            if (amazonS3Exception.ErrorCode != null &&
                (amazonS3Exception.ErrorCode.Equals("InvalidAccessKeyId") ||
                amazonS3Exception.ErrorCode.Equals("InvalidSecurity"))) {
                return false;
            } else {
                return false;
            }
        }
    }

    public static string GetACRALog(string reportid) {
        string accessKeyID = Conf.AppSettings["AWSAccessKey"];
        string secretAccessKeyID = Conf.AppSettings["AWSSecretKey"];
        using (AmazonS3 client = Amazon.AWSClientFactory.CreateAmazonS3Client(accessKeyID, secretAccessKeyID)) {
            GetPreSignedUrlRequest request = new GetPreSignedUrlRequest()
                .WithBucketName(Conf.AppSettings["BucketLog"])
                .WithKey(reportid + ".json")
                .WithExpires(DateTime.Now.Add(new TimeSpan(0, 24, 0, 0)));
            return client.GetPreSignedURL(request);
        }
    }
}