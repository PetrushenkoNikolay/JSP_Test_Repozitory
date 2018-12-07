<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="product.Product"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    Here is must be list of the products
    <%
    HttpSession sess = request.getSession();
    ArrayList<Product> list = (ArrayList<Product>)sess.getAttribute("productList");
    for (int i=0; i<list.size(); i++) {
    	Product prod = list.get(i);
    	out.println("<p>");
    	out.println(prod.getName()+" "+prod.getBrand()+" "+prod.getColor()+" "+prod.getDescription());
    	out.println("</p>");
    	out.println("<hr>");
    }
    %>
 </body>
</html>
