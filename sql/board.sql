USE jsp;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(5000) NOT NULL,
    writer   VARCHAR(200)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

SELECT *
FROM board;

SELECT COUNT(*)
FROM board;
# 페이징 연습용 게시물 복붙
INSERT INTO board
    (title, content, writer)
SELECT title, content, writer
FROM board;

# 안전모드 해제
SET SQL_SAFE_UPDATES = 0;
# 안전모드 활성화
SET SQL_SAFE_UPDATES = 1;

DELETE
FROM board
WHERE writer = '';