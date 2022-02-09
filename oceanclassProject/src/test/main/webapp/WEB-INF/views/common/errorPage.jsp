<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<br>
    <div align="center">	
        <img src="https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/v1428063104/mke3a61t8rmczxk6u43c.png" width="300px;">
        <br><br>
        <h1 style="font-weight:bold">${ errorMsg }</h1>
    </div>
    <br>
	
	<jsp:include page="../common/footerBar.jsp" />
	
</body>
</html>