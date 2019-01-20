CREATE SEQUENCE members_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE members
(
    members_seq        INT             NOT NULL, 
    members_name       VARCHAR2(20)    NOT NULL, 
   	members_email      VARCHAR2(20)    NOT NULL,
    members_pw         VARCHAR2(20)    NOT NULL, 
    CONSTRAINT MEMBERS_PK PRIMARY KEY (members_seq)
);
