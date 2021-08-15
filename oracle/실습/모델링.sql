--FLOWER 테이블 생성
--컬럼명 NUM NAME AGE COLOR
--초기값을 지정 -> DEFAULT
CREATE TABLE FLOWER(
NUM VARCHAR2(20),
NAME VARCHAR2(20),
AGE NUMBER(2) DEFAULT 0,
COLOR VARCHAR2(20),
CONSTRAINT FLOWER_PK PRIMARY KEY(NUM)
);
ALTER TABLE FLOWER RENAME TO FLOWER2;
ALTER TABLE FLOWER2 ADD PRICE NUMBER(10);

--STUDENT 테이블
--학번 이름 전공 성별
--컬럼명 IN (값1,값2,,) : 데이터가 값들 중 하나면 참
--PK를 조합으로 설정 : ID와 NAME 모두 일치해야지만 구별가능
--                            다중PK의 컬럼들의 값이 전부 중복되어야 PK충돌이 일어난다
CREATE TABLE STUDENT(
ID NUMBER(8),
NAME VARCHAR2(20),
MAJOR VARCHAR2(20),
GENDER CHAR(1) CONSTRAINT BAN_CHAR CHECK(GENDER IN ('M','W')),
CONSTRAINT STU_PK PRIMARY KEY(ID,NAME)
);

--DROP : 지운거 되돌릴 수 있기 때문에 많이 이용
--TRUNCATE : 틀은 남아있고 데이터만 사라진다. 사라진 데이터를 복구할 수 없기 때문에 확실하게 삭제할때 이용
DROP TABLE FLOWER2;
DROP TABLE STUDENT;

--쇼핑몰
--사용자 상품 주문
--사용자 : 아이디(PK) 비밀번호 이름 주소 연락처
--상품 : 상품코드(PK) 상품이름 가격 수량 제조사
--주문 : 주문번호(PK) 이름 주소 연락처 상품이름 가격 구매수량
--                         --------------------  ---------------
--                            사용자ID(FK)      상품코드(FK)
CREATE TABLE "USER"(
USERID VARCHAR2(20),
USERPW VARCHAR2(20),
USERNAME VARCHAR2(20),
USERADDR VARCHAR2(200),
USERPHONE VARCHAR2(11),
CONSTRAINT USER_PK PRIMARY KEY(USERID)
);
CREATE TABLE GOODS(
GOODSID VARCHAR2(20),
GOODSNAME VARCHAR2(100),
GOODSPRICE NUMBER(8),
GOODSQTT NUMBER(8),
GOODSCOMP VARCHAR2(50),
CONSTRAINT GOODS_PK PRIMARY KEY(GOODSID)
);
CREATE TABLE "ORDER"(
ORDERID VARCHAR2(20) CONSTRAINT ODER_PK PRIMARY KEY,
USERID VARCHAR2(20),
GOODSID VARCHAR2(20),
ORDEROTT NUMBER(8) NOT NULL,
CONSTRAINT USER_FK FOREIGN KEY(USERID) REFERENCES "USER"(USERID),
CONSTRAINT GOODS_FK FOREIGN KEY(GOODSID) REFERENCES GOODS(GOODSID)
);

--부모테이블 생성 -> 자식 테이블 생성
--자식테이블 삭제 -> 부모 테이블 삭제
DROP TABLE "ORDER";
DROP TABLE "USER";
DROP TABLE "GOODS";

--꽃집
--꽃 화분
--꽃 : 꽃코드(PK) 이름 꽃말 색상 가격 들어온 날짜
--화분 : 화분코드(PK) 꽃이름(->꽃코드(FK)) 화분가격 화분크기
--DEFAULT SYSDATE : 현재 시각을 초기값으로 지정한다
SELECT SYSDATE FROM DUAL;
CREATE TABLE FLOWER(
FLOWERID VARCHAR2(20) CONSTRAINT FLOWER_PK PRIMARY KEY,
FLOWERNAME VARCHAR2(20),
FLOWERMESS VARCHAR2(200),
FLOWERCOLOR VARCHAR2(50),
FLOWERPRICAE NUMBER(10),
FLOWERDATE DATE DEFAULT SYSDATE
);
CREATE TABLE POT(
POTID VARCHAR2(20),
FLOWERID VARCHAR2(20),
POTPRICE NUMBER(10),
POTSIZE VARCHAR2(10) CHECK(POTSIZE IN ('대','중','소')),
CONSTRAINT POT_PK PRIMARY KEY(POTID),
CONSTRAINT POT_FK FOREIGN KEY(FLOWERID) REFERENCES FLOWER(FLOWERID)
);

--수강신청
--학생 과목 교수 학과 수강
--학생 : 학번(pk) 비밀번호 이름 주민번호 전공(->학과명(fk)) 학년 주소 폰번호
--과목 : 과목코드(pk) 과목명 담당교수(교수코드(fk)) 진행시간 강의실 인정학점 학과(학과명(fk)) 정원수
--교수 : 교수코드(pk) 이름 담당전공(학과명(fk)) 주소 폰번호 급여
--학과 : 학과명(pk) 소속대학 인원
--수강 : 시퀀스(pk) 과목코드(pk)(과목코드(fk)) 수강생(학번(fk))
create table major(
majorname varchar2(100),
majorcollege varchar2(100),
majornum number(3),
constraint major_pk primary key(majorname)
);
--UNIQUE : 프라이머리 키는 아니지만 겹칠 수 없는 값
create table student(
stuid varchar2(20),
stupw varchar2(50),
stuname varchar2(20),
stujumin char(13) UNIQUE,
majorname varchar2(100),
stugrade number(1) check(stugrade in (1,2,3,4,5)),
stuaddr varchar2(100),
stuphone varchar2(11),
constraint stu_pk primary key(stuid),
constraint stu_fk foreign key(majorname) references major(majorname)
);
CREATE TABLE PROFESSOR(
PROID VARCHAR2(20) CONSTRAINT PRO_PK PRIMARY KEY,
PRONAME VARCHAR2(20),
MAJORNAME varchar2(100),
PROADDR VARCHAR2(100),
PROPHONE VARCHAR2(11),
PROPAY NUMBER(10),
CONSTRAINT PRO_FK FOREIGN KEY(MAJORNAME) REFERENCES MAJOR(MAJORNAME)
);
CREATE TABLE SUBJECT(
SUBID VARCHAR2(20) CONSTRAINT SUB_PK PRIMARY KEY,
SUBNAME VARCHAR2(20),
PROID VARCHAR2(20),
SUBTIME NUMBER(3),
SUBROOM VARCHAR2(10),
SUBCREDIT NUMBER(2,1),
majorname varchar2(100),
SUBMAXSTU NUMBER(3),
CONSTRAINT SUB_FK FOREIGN KEY(PROID) REFERENCES PROFESSOR(PROID),
CONSTRAINT SUB_FK2 FOREIGN KEY(MAJORNAME) REFERENCES MAJOR(MAJORNAME)
);
--정다솔이 자바 첫번째 신청하면 김사과가 자바 첫번쨰 신청할 수 없다 -> 따라서 PK를 시퀀스와 과목명으로 준다
CREATE TABLE LECTURE(
LISTSEQ NUMBER(3),
stuid varchar2(20),
SUBID VARCHAR2(20),
CONSTRAINT LEC_PK PRIMARY KEY(LISTSEQ,SUBID),
CONSTRAINT LEC_FK FOREIGN KEY(STUID) REFERENCES STUDENT(STUID),
CONSTRAINT LEC_FK2 FOREIGN KEY(SUBID) REFERENCES SUBJECT(SUBID)
);

