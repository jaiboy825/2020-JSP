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
		String[] board;
	int count;
	String pageNum;
	if (request.getParameter("pageNum") == null) {
		pageNum = "1";
	} else {
		pageNum = request.getParameter("pageNum");
	}
	if (session.getAttribute("board") == null) {
		count = 1;
		board = new String[count];
	} else {
		board = (String[]) session.getAttribute("board");
		count = board.length + 1;
	}

	String title = request.getParameter("title");

	if (count > 1) {
		String[] temp = new String[count];

		for (int i = 0; i < board.length; i++) {
			temp[i] = board[i];
		}
		// 배열의 마지막 방번호는 -1 
		temp[count - 1] = title;
		board = temp;
	} else if (count == 1) {
		board[0] = title;
	}
	session.setAttribute("board", board);
	response.sendRedirect("boardWrite.jsp?pageNum=" + pageNum);
	%>
</body>
</html>