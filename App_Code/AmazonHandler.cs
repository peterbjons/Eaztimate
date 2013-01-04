using System;
using System.Collections.Generic;
using Conf = System.Configuration.ConfigurationManager;
using System.Linq;
using System.Web;
using Amazon.S3;
using Amazon.S3.Model;

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
}