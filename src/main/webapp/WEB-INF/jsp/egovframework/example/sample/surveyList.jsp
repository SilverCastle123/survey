<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>설문 목록</h2>
<a href="form.do">새 설문 등록</a>
<table border="1">
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>등록일</th>
  </tr>
  <c:forEach var="survey" items="${surveys}">
    <tr>
      <td>${survey.surveyId}</td>
      <td>${survey.title}</td>
      <td>${survey.regDate}</td>
    </tr>
  </c:forEach>
</table>

</body>
</html>