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
            <span class="reg-date">${survey.regDate}</span>
        </div>
    </c:forEach>
</div>

<script>
	const surveyIds = "${surveyIds}";
	const savedOrder = surveyIds.startsWith(',') 
    	? surveyIds.substring(1).split(',').map(Number) 
    	: surveyIds.split(',').map(Number);

    // 저장된 순서대로 surveyContainer 내부 요소 재배치
    window.onload = function() {
        const container = document.getElementById('surveyContainer');
        const items = Array.from(container.children);
        const map = {};
        items.forEach(item => {
            const id = parseInt(item.querySelector('.survey-id').value);
            map[id] = item;
        });
        savedOrder.forEach(id => {
            if (map[id]) container.appendChild(map[id]);
        });
    }

    // 🚨 순서 저장 함수
window.saveOrder = function () {
    console.log("saveOrder 함수 호출됨");

    const draggables = document.querySelectorAll('.draggable');
    console.log("드래그 요소 개수:", draggables.length);

    const data = Array.from(draggables).map((el, idx) => ({
        surveyId: parseInt(el.querySelector('.survey-id').value),
        orderNo: idx
    }));

    console.log("전송 데이터:", data);

    fetch('${pageContext.request.contextPath}/surveys/saveOrder.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(res => res.text())
    .then(console.log)
    .catch(console.error);
};
</script>

<script>
(() => {
    const $ = (select) => document.querySelectorAll(select);
    const draggables = $('.draggable');
    const containers = $('.container');

    draggables.forEach(el => {
        el.addEventListener('dragstart', () => el.classList.add('dragging'));
        el.addEventListener('dragend', () => el.classList.remove('dragging'));
    });

    function getDragAfterElement(container, y) {
        const draggableElements = [...container.querySelectorAll('.draggable:not(.dragging)')];
        return draggableElements.reduce((closest, child) => {
            const box = child.getBoundingClientRect();
            const offset = y - box.top - box.height / 2;
            if (offset < 0 && offset > closest.offset) {
                return { offset: offset, element: child };
            } else {
                return closest;
            }
        }, { offset: Number.NEGATIVE_INFINITY }).element;
    }

    containers.forEach(container => {
        container.addEventListener('dragover', e => {
            e.preventDefault();
            const afterElement = getDragAfterElement(container, e.clientY);
            const draggable = document.querySelector('.dragging');
            if (afterElement == null) {
                container.appendChild(draggable);
            } else {
                container.insertBefore(draggable, afterElement);
            }
        });
    });
})();
</script>

</body>
</html>
