DROP SEQUENCE SEQ_BOARD;

DROP TABLE TBL_BOARD;

CREATE SEQUENCE SEQ_BOARD;
CREATE TABLE TBL_BOARD(
	BNO NUMBER(10, 0),
	WRITER VARCHAR2(50) NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE
);

INSERT INTO TBL_BOARD (BNO, WRITER, TITLE, CONTENT)VALUES(
	SEQ_BOARD.NEXTVAL, 'WRITER 1', 'TITLE TEST!', 'CONTENT TEST TESTING 12345'
);

SELECT * FROM TBL_BOARD;
