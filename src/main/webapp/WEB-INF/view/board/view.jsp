<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/WEB-INF/fragment/navbar.jsp">
    <h2>${board.id}번 게시글 보기</h2>

    <div>
        제목
        <input type="text" value="${board.title}" readonly>
    </div>
    <div>
        본문
        <textarea id="" cols="30" rows="10">value="${board.content}"</textarea>
    </div>
    <div>
        작성자
        <input type="text" value="${board.writer}" readonly>
    </div>
    <div>
        작성일시
        <input type="text" value="${board.inserted}" readonly>
    </div>
</c:import>
</body>
</html>
