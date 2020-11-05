<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//Data.valueOf는 데이터타입 형태를 오라클의 Date 형태로 가져온다  // java.sql.date
		Date passDate = Date.valueOf(LocalDate.now());
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String passDate2 = sdf.format(passDate); // Date.valueOf yyyy-MM-dd

		//String -> date : form 에서 사용자가 입력한 데이터를 String 으로 저장된 것을 date 롤 변경
		Date testDate = Date.valueOf(passDate2);
	%>
	<%=testDate%>
</body>
</html>