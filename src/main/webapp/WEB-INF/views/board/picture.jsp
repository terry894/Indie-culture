<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
  <c:when test="${files2.filename != null }">
<img src="/Thumnail/${files2.filename}" height="200" width="100%">  
</c:when>
<c:otherwise>
<img src="/uploadFiles/noimg.jpg" height="200" width="100%">
</c:otherwise>
</c:choose>	
</body>
</html>