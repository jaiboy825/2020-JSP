<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>한 줄 게시글</h2>
		<form action="boardWritePro.jsp" method="get">
			<input type="text" name="title"> <input type="submit"
				value="upload">
		</form>
		<pre>
 페이지 번호 추가 , 최신글부터 보여주기 , 한 페이지는 3개만 보여주기 
</pre>
		<%
			String[] board;
		int count; // 게시글 갯수 
		String pageNum;
		int pageSize = 3;
		if (session.getAttribute("board") != null) {
			if (request.getParameter("pageNum") == null) {
				pageNum = "1";
			} else {
				pageNum = request.getParameter("pageNum");
			}
			board = (String[]) session.getAttribute("board");
			count = board.length;
			int curPage = Integer.parseInt(pageNum);
			int start = (curPage - 1) * pageSize;
			int end = curPage * pageSize;
			if (end > count) {
				end = count;
			}
			int number = count - (curPage - 1) * pageSize;
			System.out.println("count = " + count);
		%>
		<table>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
			</tr>
			<%
				for (int i = end - 1; i >= start; i--) {
			%>
			<tr>
				<td><%=number%></td>
				<td><%=board[number - 1]%></td>
			</tr>
			<%
				number--;
			}
			// 패이징 처리
			%>
		</table>
		<%
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		for (int i = startPage; i <= pageCount; i++) {
		%>
		<a href="boardWrite.jsp?pageNum=<%=i%>"> [<%=i%>]
		</a>
		<%
			}
		}
		%>
	</div>

</body>
</html>