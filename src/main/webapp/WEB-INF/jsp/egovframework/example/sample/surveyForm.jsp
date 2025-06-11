<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>설문 등록</h2>
<form action="save.do" method="post">
  제목: <input type="text" name="title"><br>
  설명: <textarea name="description"></textarea><br>
  <input type="submit" value="등록">
</form>
</body>
</html>