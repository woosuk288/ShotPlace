GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO shot IDENTIFIED BY place;
ALTER USER shot DEFAULT TABLESPACE USERS;
ALTER USER shot TEMPORARY TABLESPACE TEMP;
CONNECT shot/place

-- 회원테이블 
CREATE TABLE member (
    email varchar2(60) PRIMARY KEY,
    passwd varchar2(20) NOT NULL,
    name varchar2(20) NOT NULL,
    mobile varchar2(20)
);

-- 게시판 종류
create table board (
	boardcd varchar2(20),
	boardnm varchar2(40) NOT NULL,
	constraint PK_BOARD PRIMARY KEY(boardcd)
);

-- 게시글
create table article (
	articleno number,
	boardcd varchar2(20),
	title varchar2(200) NOT NULL,
	content clob,
	email varchar2(60),
	hit number,	
	regdate date,
	constraint PK_ARTICLE PRIMARY KEY(articleno),
	constraint FK_ARTICLE FOREIGN KEY(boardcd) REFERENCES board(boardcd)
);

-- 게시글 번호 생성기 
create sequence SEQ_ARTICLE
increment by 1
start with 1;

--게시판 데이터 입력
insert into board values ('free','자유게시판');
insert into board values ('qna','QnA게시판');
insert into board values ('data','자료실');

insert into article values(seq_article.nextval, 'free', 'test1', 'it''s test1', 'email1', 0, sysdate)
insert into article values(seq_article.nextval, 'free', 'test2', 'it''s \*test2', 'email2', 0, sysdate)
insert into article values(seq_article.nextval, 'free', 'test2', 'it''s \$test3', 'email3', 0, sysdate)

-- 첨부파일 
create table attachfile (
	attachfileno number,
	filename varchar2(50) NOT NULL,
	filetype varchar2(30),
	filesize number,
	articleno number,
	constraint PK_ATTACHFILE PRIMARY KEY(attachfileno)
);

-- 첨부파일 번호 생성기
create sequence SEQ_ATTACHFILE
increment by 1
start with 1;

-- 덧글
create table comments (
	commentno number,
	articleno number,	
	email varchar2(60),	
	memo varchar2(4000),
	regdate date, 
	constraint PK_COMMENTS PRIMARY KEY(commentno)
);

-- 덧글 번호 생성기
create sequence SEQ_COMMENTS
	increment by 1
	start with 1;

commit 

select * from board 
