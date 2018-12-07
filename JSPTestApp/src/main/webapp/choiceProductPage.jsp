<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choice of products</title>
</head>
<body>
    <form id="form" action="" method="get">
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
    Введите цену  от<input id="minPrice" type="text" placeholder="0.00 руб" required="required">
    до<input id="maxPrice" type="text" placeholder="0.00 руб" required="required"> 
    <br><br>
    <button id="submit" onclick="doRequest()">Показать</button>
    </form>
    <script>
        function doRequest() {
			var name = document.getElementById("selectTypeForm").value;
			var brand = document.getElementById("selectBrandForm").value;
			var color = document.getElementById("selectColorForm").value;
			var minPrice = document.getElementById("minPrice").value;
			var maxPrice = document.getElementById("maxPrice").value;
			alert('');
			var params = 'name='+encodeURIComponent(name)+'&brand='+encodeURIComponent(brand)+'&color='+encodeURIComponent(color)+'&minPrice'+encodeURIComponent(minPrice)+'&maxPrice'+encodeURIComponent(maxPrice);
			alert(params);
			var xhr = new XMLHttpRequest();
			alert('xhr created');
			xhr.open("get",'ChoiceProductServlet?'+params);
			alert('xhr opened');
			xhr.send();
			alert('xhr sent');
			xhr.onreadystatechange = function() {
				if (readyState!=4) return;
				if (status=200) alert("ok!");
			}
		}
    </script>
</body>
</html>