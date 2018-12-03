<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Upload file page</title>
</head>
<body>
  <p>
    This page is for upload your file on server
  </p>
  <p>
    Select file for upload
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
      <input type="file" name="file" accept=".jpg">
      <input type="submit" name="Upload file">
    </form>
  </p>
</body>
</html>