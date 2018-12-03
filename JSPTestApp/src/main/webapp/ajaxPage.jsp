<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page for testing AJAX</title>
</head>
<body>
  <p>
    On this page you can see AJAX technology in action<br>
    Just check checkbox
  </p>
  <p>
    <label>Check box 1<input type="checkbox" name="checkbox1" onchange="doCheckboxFunc1()"></label>
  </p>
  <p>
    <label>Check box 2<input type="checkbox" name="checkbox2"></label>
  </p>
  <div id="displayDiv"></div>
  <script>
    function doCheckboxFunc1() {
      var chbox1 = document.getElementsByName("checkbox1")[0];
      var param = "box=1";
        if (chbox1.checked) {
    	var xhr = new XMLHttpRequest();
    	xhr.open("post","AjaxProcessingServlet",true);
    	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	xhr.send(param);
    	xhr.onreadystatechange = function () {
    	  if (this.readyState!=4) {
    	    return;
    	  }
    	  if (this.status!=200) {
    	    alert('Error encountered');
    	  }
    	  var dispDiv = document.getElementById("displayDiv");
    	  dispDiv.innerHTML = xhr.responseText;
    	}
      } else {
    	  var dispDiv = document.getElementById("displayDiv");
    	  dispDiv.innerHTML = '';
      }
      
    	
    }
  </script>
</body>
</html>