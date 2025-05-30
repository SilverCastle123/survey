<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>설문조사</title>
    <style>
        .category { font-weight: bold; font-size: 18px; margin-top: 30px; }
        .question { margin: 10px 0; }
    </style>
    <script>
        function addQuestion(sectionId) {
            const container = document.getElementById("questions-" + sectionId);
            const index = container.children.length + 1;

            const newDiv = document.createElement("div");
            newDiv.className = "question";
            newDiv.innerHTML = `
                <label>${index}. 질문 내용을 입력하세요:
                    <input type="text" name="section${sectionId}_q${index}" style="width: 400px;" />
                </label>
            `;
            container.appendChild(newDiv);
        }
    </script>
</head>
<body>
    <h2>설문조사 양식</h2>

    <!-- Section 5 -->
    <div class="category">5. 전체 정보서비스 만족도 [필수]</div>
    <div id="questions-5">
        <div class="question">
            <label>1) 정보시스템 및 서비스(예: 0시기) 기반으로 운영 중인 정보전략의 정보서비스에 대한 만족도는?
                <input type="text" name="section5_q1" style="width: 400px;" />
            </label>
        </div>
        <div class="question">
            <label>2) 전년 대비 정보전략의 정보서비스에 대한 만족도는?
                <input type="text" name="section5_q2" style="width: 400px;" />
            </label>
        </div>
    </div>
    <button type="button" onclick="addQuestion(5)">+ 문항 추가</button>

    <!-- Section 6 -->
    <div class="category">6. 기타 정보 [필수]</div>
    <div id="questions-6">
        <div class="question">
            <label>1) 귀하의 근무부서는 어디신가요?
                <input type="text" name="section6_q1" style="width: 400px;" />
            </label>
        </div>
        <div class="question">
            <label>2) 귀하의 직급은?
                <input type="text" name="section6_q2" style="width: 400px;" />
            </label>
        </div>
    </div>
    <button type="button" onclick="addQuestion(6)">+ 문항 추가</button>

    <br><br>
    <input type="submit" value="제출하기" />
</body>
</html>
