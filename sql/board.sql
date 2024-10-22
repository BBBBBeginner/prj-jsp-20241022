USE jsp;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200) NOT NULL,
    content  VARCHAR(200) NOT NULL,
    writer   VARCHAR(200) NOT NULL,
    inserted DATETIME     NOT NULL DEFAULT NOW()
);

SELECT *
FROM board