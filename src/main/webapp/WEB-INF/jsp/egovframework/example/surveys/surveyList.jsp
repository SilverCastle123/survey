<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Drag & Drop</title>
    <style>
        body, div { margin: 0; }
        .container { background-color: #f3f5f7; padding: 2rem; border-collapse: collapse; }
        .container:nth-child(n+2){ margin-top: 1rem; }
        .draggable { height: 82px; line-height: 82px; padding: 0 20px; background-color: white; border: 1px solid #c5cdd7; border-bottom:none; box-sizing: border-box; cursor: move; }
        .draggable:last-child { border-bottom: 1px solid #c5cdd7; }
        .draggable.dragging { opacity: .5; border: 2px dashed red; }
        .el { display: inline-block; vertical-align: middle; }
        .ico-drag { display: inline-block; vertical-align: inherit; width: 15px; }
    </style>
</head>


<body>

<a href="form.do">새 설문 등록</a>
<button onclick="saveOrder()">순서 저장</button>

<%-- surveyIds 문자열 만들기 --%>
<c:set var="surveyIds" value="" />
<c:forEach var="s" items="${surveys}">
    <c:set var="surveyIds" value="${surveyIds},${s.surveyId}" />
</c:forEach>

<div class="container" id="surveyContainer">
    <c:forEach var="survey" items="${surveys}">
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>
            <input type="hidden" name="surveyId" class="survey-id" value="${survey.surveyId}" />
            <input type="text" class="el" value="${survey.title}" />
            <input type="text" class="el" value="${survey.description}" />
            <span class="reg-date">${survey.regDate}</span>
            <button type="button" class="delete-btn el">삭제</button>
        </div>
    </c:forEach>
</div>


<script>

window.contextPath = "${pageContext.request.contextPath}";
window.surveyIds = "${surveyIds}";

</script>

<!-- 외부 스크립트 불러오기 -->
<script src="${pageContext.request.contextPath}/resources/js/survey.js"></script>

</body>



</html>
