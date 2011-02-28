using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace jfuExample
{
    /// <summary>
    /// File Upload httphandler to receive files and save them to the server.
    /// </summary>
    public class FileUpload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            if (context.Request.Files.Count == 0)
            {

                LogRequest("No files sent.");

                context.Response.ContentType = "text/plain";
                context.Response.Write("No files received.");

            }
            else
            {

                HttpPostedFile uploadedfile = context.Request.Files[0];

                string FileName = uploadedfile.FileName;
                string FileType = uploadedfile.ContentType;
                int FileSize = uploadedfile.ContentLength;

                LogRequest(FileName + ", " + FileType + ", " + FileSize);

                uploadedfile.SaveAs(HttpContext.Current.Server.MapPath("/Upload") + "\\" + uploadedfile.FileName);

                context.Response.ContentType = "text/plain";
                context.Response.Write("{\"name\":\"" + FileName + "\",\"type\":\"" + FileType + "\",\"size\":\"" + FileSize + "\"}");

            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        private void LogRequest(string Log)
        {
            StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath("/Log") + "\\Log.txt", true);
            sw.WriteLine(DateTime.Now.ToString() + " - " + Log);
            sw.Flush();
            sw.Close();
        }
    }
}