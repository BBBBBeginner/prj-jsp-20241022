<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<%-- 수정/삭제 권한 --%>
<c:set value="${sessionScope.loggedInMember.id == member.id}" var="hasAccess"/>


<%--div.container>div.row>div.col--%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-6">

            <h2 class="my-3">회원 정보</h2>

            <div class="mb-3">
                <label for="inputId1" class="form-label">
                    아이디
                </label>
                <input value="${member.id}" readonly id="inputId1" name="id" type="text" class="form-control">
            </div>
            <div class="mb-3">
                <label for="inputPassword1" class="form-label">
                    암호
                </label>
                <div class="input-group">
                    <input value="${member.password}" readonly id="inputPassword1" name="password" type="text"
                           class="form-control">
                    <c:if test="${hasAccess}">
                        <a href="/member/edit-password?id=${member.id}" class="btn btn-outline-secondary">
                            변경
                        </a>
                    </c:if>
                </div>
            </div>
            <div class="mb-3">
                <label for="inputNickName1" class="form-label">
                    별명
                </label>
                <input value="${member.nickName}" readonly id="inputNickName1" name="nickName" type="text"
                       class="form-control">
            </div>
            <div class="mb-3">
                <label for="textareaDescription1" class="form-label">
                    자기소개
                </label>
                <textarea readonly type="text"
                          class="form-control"
                          id="textareaDescription1"
                          rows="10"
                          name="description"
                >${member.description}</textarea>
            </div>
            <div class="mb-3">
                <label for="inputInserted1" class="form-label">
                    가입일시
                </label>
                <input class="form-control" id="inputInserted1" type="datetime-local" value="${member.inserted}"
                       readonly>
            </div>
            <div class="mb-3">
                <c:if test="${hasAccess}">
                    <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal1">
                        <i class="fa-solid fa-user-minus"></i>
                        탈퇴
                    </button>
                    <a class="btn btn-outline-primary" href="/member/edit?id=${member.id}">
                        <i class="fa-solid fa-user-pen"></i>
                        수정
                    </a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<c:if test="${hasAccess}">
    <!-- Modal -->
    <div class="modal fade" id="deleteConfirmModal1" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">탈퇴 확인</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <form action="/member/delete" method="post" id="deleteForm1">
                            <input type="hidden" name="id" value="${member.id}">
                            <label for="inputPassword2" class="form-label">
                                암호
                            </label>
                            <input class="form-control" type="text" name="password" id="inputPassword2">
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        닫기
                    </button>
                    <button form="deleteForm1" class="btn btn-danger">
                        탈퇴
                    </button>
                </div>
            </div>
        </div>
    </div>
</c:if>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>