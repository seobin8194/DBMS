--FLOWER ���̺� ����
--�÷��� NUM NAME AGE COLOR
--�ʱⰪ�� ���� -> DEFAULT
CREATE TABLE FLOWER(
NUM VARCHAR2(20),
NAME VARCHAR2(20),
AGE NUMBER(2) DEFAULT 0,
COLOR VARCHAR2(20),
CONSTRAINT FLOWER_PK PRIMARY KEY(NUM)
);
ALTER TABLE FLOWER RENAME TO FLOWER2;
ALTER TABLE FLOWER2 ADD PRICE NUMBER(10);

--STUDENT ���̺�
--�й� �̸� ���� ����
--�÷��� IN (��1,��2,,) : �����Ͱ� ���� �� �ϳ��� ��
--PK�� �������� ���� : ID�� NAME ��� ��ġ�ؾ����� ��������
--                            ����PK�� �÷����� ���� ���� �ߺ��Ǿ�� PK�浹�� �Ͼ��
CREATE TABLE STUDENT(
ID NUMBER(8),
NAME VARCHAR2(20),
MAJOR VARCHAR2(20),
GENDER CHAR(1) CONSTRAINT BAN_CHAR CHECK(GENDER IN ('M','W')),
CONSTRAINT STU_PK PRIMARY KEY(ID,NAME)
);

--DROP : ����� �ǵ��� �� �ֱ� ������ ���� �̿�
--TRUNCATE : Ʋ�� �����ְ� �����͸� �������. ����� �����͸� ������ �� ���� ������ Ȯ���ϰ� �����Ҷ� �̿�
DROP TABLE FLOWER2;
DROP TABLE STUDENT;

--���θ�
--����� ��ǰ �ֹ�
--����� : ���̵�(PK) ��й�ȣ �̸� �ּ� ����ó
--��ǰ : ��ǰ�ڵ�(PK) ��ǰ�̸� ���� ���� ������
--�ֹ� : �ֹ���ȣ(PK) �̸� �ּ� ����ó ��ǰ�̸� ���� ���ż���
--                         --------------------  ---------------
--                            �����ID(FK)      ��ǰ�ڵ�(FK)
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

--�θ����̺� ���� -> �ڽ� ���̺� ����
--�ڽ����̺� ���� -> �θ� ���̺� ����
DROP TABLE "ORDER";
DROP TABLE "USER";
DROP TABLE "GOODS";

--����
--�� ȭ��
--�� : ���ڵ�(PK) �̸� �ɸ� ���� ���� ���� ��¥
--ȭ�� : ȭ���ڵ�(PK) ���̸�(->���ڵ�(FK)) ȭ�а��� ȭ��ũ��
--DEFAULT SYSDATE : ���� �ð��� �ʱⰪ���� �����Ѵ�
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
POTSIZE VARCHAR2(10) CHECK(POTSIZE IN ('��','��','��')),
CONSTRAINT POT_PK PRIMARY KEY(POTID),
CONSTRAINT POT_FK FOREIGN KEY(FLOWERID) REFERENCES FLOWER(FLOWERID)
);

--������û
--�л� ���� ���� �а� ����
--�л� : �й�(pk) ��й�ȣ �̸� �ֹι�ȣ ����(->�а���(fk)) �г� �ּ� ����ȣ
--���� : �����ڵ�(pk) ����� ��米��(�����ڵ�(fk)) ����ð� ���ǽ� �������� �а�(�а���(fk)) ������
--���� : �����ڵ�(pk) �̸� �������(�а���(fk)) �ּ� ����ȣ �޿�
--�а� : �а���(pk) �ҼӴ��� �ο�
--���� : ������(pk) �����ڵ�(pk)(�����ڵ�(fk)) ������(�й�(fk))
create table major(
majorname varchar2(100),
majorcollege varchar2(100),
majornum number(3),
constraint major_pk primary key(majorname)
);
--UNIQUE : �����̸Ӹ� Ű�� �ƴ����� ��ĥ �� ���� ��
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
--���ټ��� �ڹ� ù��° ��û�ϸ� ������ �ڹ� ù���� ��û�� �� ���� -> ���� PK�� �������� ��������� �ش�
CREATE TABLE LECTURE(
LISTSEQ NUMBER(3),
stuid varchar2(20),
SUBID VARCHAR2(20),
CONSTRAINT LEC_PK PRIMARY KEY(LISTSEQ,SUBID),
CONSTRAINT LEC_FK FOREIGN KEY(STUID) REFERENCES STUDENT(STUID),
CONSTRAINT LEC_FK2 FOREIGN KEY(SUBID) REFERENCES SUBJECT(SUBID)
);

