<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload file page with AJAX</title>
</head>
<body>
  <p>
    Page for upload file via AJAX
  </p>
  <form id="form" action="" enctype="multipart/form-data">
    <input type="file" name="file" required="required">
    <br><br>
    <button onclick="doAjax()">Send file</button>
  </form>
</body>
<script>
  function doAjax() {
	alert("doAjax function invoked");
	var xhr = new XMLHttpRequest();
	var fileForm = document.getElementById("form");
	var formData = new FormData(fileForm);
	xhr.open("post","UploadServlet",true);
	xhr.send(formData);
	alert("image was sent");
}
</script>
</html>