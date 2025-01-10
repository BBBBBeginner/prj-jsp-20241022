USE jsp;

CREATE TABLE member
(
    id          VARCHAR(50) PRIMARY KEY,
    password    VARCHAR(100) NOT NULL,
    nick_name   VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(2000),
    inserted    DATETIME     NOT NULL DEFAULT NOW()
);

SELECT *
FROM member;

# 권한 테이블
CREATE TABLE auth
(
    id   VARCHAR(50) REFERENCES member (id),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id, name)
);

INSERT INTO member(id, password, nick_name, description)
VALUES ('admin', 'hashed_password', '관리자', '관리자 계정입니다.'),
       ('bdmin', 'hashed_password', '부관리자', '부관리자 계정입니다.');

UPDATE member
SET password = 'admin'
WHERE id = 'admin';

# admin, bdmin
INSERT INTO auth
    (id, name)
VALUES ('admin', 'admin'),
       ('bdmin', 'admin');

SELECT *
FROM board
ORDER BY id DESC;
SELECT *
FROM member;

# 게시물의 writer 값을 member에 있는 값으로 update
UPDATE board
SET writer = (SELECT id FROM member LIMIT 1)
WHERE id > 0;

# board.writer -> member.id 참조 (외래키) 추가
ALTER TABLE board
    ADD FOREIGN KEY (writer) REFERENCES member (id);