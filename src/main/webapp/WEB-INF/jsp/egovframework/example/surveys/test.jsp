<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<style>
body, div {
    margin: 0;
}

.container {
    background-color: #f3f5f7;
    padding: 2rem;
    border-collapse: collapse;
}
.container:nth-child(n+2){
    margin-top: 1rem;
}

.draggable {
    height: 82px;
    line-height: 82px;
    padding: 0 20px;
    background-color: white;
    border: 1px solid #c5cdd7;
    border-bottom:none;
    box-sizing: border-box;
    cursor: move;
}
.draggable:last-child {
    border-bottom: 1px solid #c5cdd7;
}

.draggable.dragging {
    opacity: .5;
    border: 2px dashed red;
}

.el {
    display: inline-block;
    vertical-align: middle;
}
.ico-drag {
    display: inline-block;
    vertical-align: inherit;
    width: 15p
</style>


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drag & Drop</title>
</head>
<body>
    <div class="container">
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>
            <input type="text" class="el" value="HTML" />

        </div>
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>    
            <div class="el">CSS</div>
        </div>
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>
            <div class="el">JavaScript</div>
        </div>
    </div>

    <div class="container">
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>
            <div class="el">React</div>
        </div>
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>
            <div class="el">Vue</div>
        </div>
        <div class="draggable" draggable="true">
            <span class="ico-drag"></span>
            <div class="el">Next JS</div>
        </div>
    </div>

</body>



<script>
(() => {
    const $ = (select) => document.querySelectorAll(select);
    const draggables = $('.draggable');
    const containers = $('.container');

    draggables.forEach(el => {
        el.addEventListener('dragstart', () => {
            el.classList.add('dragging');
        });

        el.addEventListener('dragend', () => {
            el.classList.remove('dragging')
        });
    });

    function getDragAfterElement(container, y) {
        const draggableElements = [...container.querySelectorAll('.draggable:not(.dragging)')]
      
        return draggableElements.reduce((closest, child) => {
          const box = child.getBoundingClientRect() //해당 엘리먼트에 top값, height값 담겨져 있는 메소드를 호출해 box변수에 할당
          const offset = y - box.top - box.height / 2 //수직 좌표 - top값 - height값 / 2의 연산을 통해서 offset변수에 할당
          if (offset < 0 && offset > closest.offset) { // (예외 처리) 0 이하 와, 음의 무한대 사이에 조건
            return { offset: offset, element: child } // Element를 리턴
          } else {
            return closest
          }
        }, { offset: Number.NEGATIVE_INFINITY }).element
    };

    containers.forEach(container => {
        container.addEventListener('dragover', e => {
            e.preventDefault()
            const afterElement = getDragAfterElement(container, e.clientY);
            const draggable = document.querySelector('.dragging')
            // container.appendChild(draggable)
            container.insertBefore(draggable, afterElement)
        })
    });
})();
</script>

</html>