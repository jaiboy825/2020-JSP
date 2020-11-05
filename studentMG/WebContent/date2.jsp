<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
vo - 데이터베이스에서 컬럼명
 date 날짜 -> String 날짜
 String -> date
 //2020-11-05 -> 2020년 11월 05일 
  date - java.util.Date // Mon Dec 30 12:30:30 GMT-0700 2008 // 범용 날짜
  // 각각을 분리 가능 / 하나의 정보로도 다룰수 있다. 
   - java.sql.Date // 2020-11-05 12:30:30 오라클 연동 오라클의 date 타입과 일치한다.
</pre>
	<%
	//date 값을 저장하는 두가지 방법 : H : 0-23 k: 1 - 24 h:1-12 K:0-11 hh:mm:ss
		// java.util.date
		Date today = new Date();
		// date 타입 -> String 타입						mm(분) mmm(영문) MM(월)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		//바꿔주고 싶은 형식
		String today2 = sdf.format(today);
		//date 타입이 들어간다
		
		// util date -> String 
		Date testDate = new SimpleDateFormat("yyyy/MM/dd").parse(today2);
		// util date 이기 때문에 / 가 가능
		
		
	%>
	<%=testDate	%>
</body>
</html>