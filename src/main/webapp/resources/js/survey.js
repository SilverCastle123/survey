// survey.js

console.log("survey.js 로드됨!");

const surveyIds = window.surveyIds || "";
const savedOrder = surveyIds.startsWith(',') 
    ? surveyIds.substring(1).split(',').map(Number) 
    : surveyIds.split(',').map(Number);

// 저장된 순서대로 surveyContainer 내부 요소 재배치
window.onload = function () {
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
};

// 순서 저장 함수
window.saveOrder = function () {
    const draggables = document.querySelectorAll('.draggable');

    const data = Array.from(draggables).map((el, idx) => ({
        surveyId: parseInt(el.querySelector('.survey-id').value),
        orderNo: idx
    }));

    fetch(`${contextPath}/saveOrder.do`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    })
    .then(res => res.text())
    .then(console.log)
    .catch(console.error);
};

// 삭제 버튼
document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll(".delete-btn");

    deleteButtons.forEach(button => {
        button.addEventListener("click", function () {
            const parent = this.closest(".draggable");
            const surveyId = parent.querySelector(".survey-id").value;

            if (confirm("정말 삭제하시겠습니까?")) {
                fetch(`${contextPath}/delete.do`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ surveyId: Number(surveyId) })
                })
                .then(res => res.text())
                .then(result => {
                    console.log(result);
                    parent.remove(); // 삭제 성공 시 DOM에서 제거
                })
                .catch(console.error);
            }
        });
    });
});

// Drag & Drop
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
