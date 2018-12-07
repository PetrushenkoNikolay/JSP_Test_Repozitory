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
    Выберите тип товара <select id="selectTypeForm">
      <option>bysicle</option>
      <option>motosycle</option>
      <option>skateboard</option>
      <option>roller scates</option>
      </select>
    <br><br>
    Выберите бренд товара <select id="selectBrandForm">
      <option>Heinkel</option>
      <option>TerraTrike</option>
      <option>Yamaha</option>
      <option>Aist</option>
      <option>AmigoSport</option>
    </select>
    <br><br>
    Выберите цвет <select id="selectColorForm">
      <option>white</option>
      <option>black</option>
      <option>red</option>
      <option>yellow</option>
      <option>green</option>
    </select>
    <br><br>
    Введите цену <input id="priceInput" type="text" placeholder="0.00 руб" required="required">
    <br><br>
    Загрузка изображения <input type="file" name="file" required="required">
    <br><br>
    <textarea id="txtarea" rows="5" cols="50" placeholder="Введите описание товара" required="required"></textarea>
    <br><br>
    <button onclick="doAjax()">Send file on the server</button>
  </form>
  <script>
    function doAjax() {
	  var xhr = new XMLHttpRequest();
	  var fileForm = document.getElementById("form");
	  var formData = new FormData(fileForm);
	  var prodDescr = document.getElementById("txtarea").value;
	  formData.append("description",prodDescr);
	  var prodColor = document.getElementById("selectColorForm").value;
	  formData.append("color",prodColor);
	  var prodName = document.getElementById("selectTypeForm").value;
	  formData.append("name",prodName);
	  var prodBrand = document.getElementById("selectBrandForm").value;
	  formData.append("brand",prodBrand);
	  var prodPrice = document.getElementById("priceInput").value;
	  formData.append("price",prodPrice);
	  xhr.open("post","UploadServlet",true);
	  xhr.send(formData);
	  }
  </script>
</body>
</html>