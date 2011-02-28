<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="jfuExample.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery File Upload C# Example</title>
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/themes/base/jquery-ui.css" id="theme">
    <link rel="stylesheet" href="../Script/jquery.fileupload-ui.css"
</head>
<body>
    <form id="file_upload" runat="server">
        <div id = "filediv">
            <input type="file" name="file" multiple>
            <button>Upload</button>
            <div>Upload files</div>
        </div>
        <table id="files"></table>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
        <script src="../Script/jquery.fileupload.js"></script>
        <script src="../Script/jquery.fileupload-ui.js"></script>
        <script>
            /*global $ */
            $(function () {
                $('#file_upload').fileUploadUI({
                    url: 'FileUpload.ashx',
                    method: 'POST',
                    uploadTable: $('#files'),
                    downloadTable: $('#files'),
                    buildUploadRow: function (files, index) {
                        return $('<tr><td>' + files[index].name + '<\/td>' +
                            '<td class="file_upload_progress"><div><\/div><\/td>' +
                            '<td class="file_upload_cancel">' +
                            '<button class="ui-state-default ui-corner-all" title="Cancel">' +
                            '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
                            '<\/button><\/td><\/tr>');
                    },
                    buildDownloadRow: function (file) {
                        return $('<tr><td>' + file.name + '<\/td><\/tr>');
                    }
                });
            });
        </script> 
    </form>
</body>
</html>
