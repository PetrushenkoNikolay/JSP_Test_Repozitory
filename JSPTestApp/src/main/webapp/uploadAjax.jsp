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
  <form id="form" action="" enctype="multipart/form-data" method="post">
    Загрузка изображения <input type="file" name="file" required="required">
    <br><br>
    <textarea id="txtarea" rows="5" cols="50" placeholder="Введите описание товара" required="required"></textarea>
    <br><br>
    Выберите цвет <select id="selectForm">
      <option>белый</option>
      <option>черный</option>
      <option>красный</option>
    </select>
    <br><br>
    <button onclick="doAjax()">Send file on the server</button>
  </form>
  <script>
    function doAjax() {
	  var xhr = new XMLHttpRequest();
	  var fileForm = document.getElementById("form");
	  var formData = new FormData(fileForm);
	  var prodDescr = document.getElementById("txtarea").value;
	  var color = document.getElementById("selectForm").value;
	  formData.append("description",prodDescr);
	  formData.append("color",color);
	  xhr.open("post","UploadServlet",true);
	  xhr.send(formData);
	  }
  </script>
</body>
</html>