--SELECT�� ����
SELECT * FROM PLAYER;
--PLAYER ���̺��� TEAM_ID�� KO1�� �ƴ� ���� �˻�
SELECT * FROM PLAYER WHERE TEAM_ID != 'K01';
--PLAYER ���̺��� �����԰� 70�̻��̰� 80������ ���� �˻�
SELECT * FROM PLAYER WHERE WEIGHT >= 70 AND WEIGHT <= 80;
--PLAYER ���̺��� TEAM-ID�� KO3�̰� Ű�� 180�̸��� ���� �˻�
SELECT * FROM PLAYER WHERE TEAM_ID = 'K03' AND HEIGHT < 180;
--PLATER ���̺��� TEAM_ID�� K06�̰� NICKNAME�� ������ ���� �˻�
SELECT * FROM PLAYER WHERE TEAM_ID = 'K06' AND NICKNAME = '����';
--Ű�� 170�̻��̰� WEIGHT�� 80�̻��� ���� �̸� �˻�
 SELECT PLAYER_NAME FROM PLAYER WHERE HEIGHT >= 170 AND WEIGHT >= 80;
--1987�� ���� ����� TEAM_ID�� K06�� ���� �˻�
SELECT * FROM PLAYER WHERE BIRTH_DATE > TO_DATE('1987','yyyy') AND TEAM_ID = 'K06';
--TEAM_ID�� K05�̰� JOIN_YYYY�� 2011�̳� 2012�� ���� �˻�
--AND�����ڰ� OR�����ں��� ���� ����ȴ�
SELECT * FROM PLAYER WHERE TEAM_ID = 'K05' AND (JOIN_YYYY = '2011' OR JOIN_YYYY = '2012');
SELECT *FROM PLAYER WHERE TEAM_ID = 'K05' AND (JOIN_YYYY IN ('2011','2012'));

--INSERT ����
--�θ� ���̺� ���� ������ �����ؾ��Ѵ�
INSERT INTO MAJOR(MAJORNUM, MAJORNAME, MAJORCOLLEGE) VALUES ('1','�İ�','�����');
INSERT INTO STUDENT(STUPHONE, STUJUMIN, STUGRADE, STUADDR, MAJORNAME, STUPW, STUID, STUNAME) 
VALUES('01054038194','9811011234567',4,'��⵵','�İ�','1234','b789058','����');
INSERT INTO PROFESSOR(PROPHONE,PROPAY,PRONAME,PROID,PROADDR, MAJORNAME)
VALUES ('01012345678',1000,'��ö','A789058','����','�İ�');
INSERT INTO SUBJECT(SUBNAME,SUBID,PROID,MAJORNAME) VALUES ('����','1107','A789058','�İ�');
INSERT INTO LECTURE(LISTSEQ,STUID,SUBID) VALUES (1,'b789058','1107');

--UPDATE�� ����
--�����Ҷ� FK�� ��� �θ� ���̺� �������� ���� ������ ������ �� ����
--UPDATE LECTURE SET STUID = 'B789063' WHERE SUBID = '1107';
UPDATE STUDENT SET STUPW = '5678' WHERE STUID = 'b789058';
--PLAYER ���̺��� TEAM_ID�� K01�� ���� �̸��� �� �̸����� �ٲٱ�
UPDATE PLAYER SET PLAYER_NAME = '������' WHERE TEAM_ID = 'K01';
--player ���̺��� �г����� ����ִ� ������ dbms�� �г��� �ٲٱ�
--IS (NOT)NULL : �÷��� ���� NULL�� ����ִٸ� �� / NULL�� �ƴϸ� ��
UPDATE PLAYER SET NICKNAME = 'dbms' WHERE NICKNAME IS NULL;
--player ���̺��� position�� df�̰� team_id�� k04�� ���� ������ �ѱ����� �ٲٱ�
UPDATE PLAYER SET NATION = 'KOREA' WHERE POSITION = 'df' AND TEAM_ID = 'K04';
--player ���̺��� 1985��� ���� �� tem_id�� k01�̰� position�� mf�� ���� nickname dbms2�� �ٲٱ�
--UPDATE PLAYER SET NICKNAME = 'DBMS2' WHERE TEAM_ID = 'K01' AND BIRTH_DATE = TO_DATE('1985','yyyy');
--DATE�� �� �����̹Ƿ� 1985����� ����� ã������ ������ ������ �ɾ�����Ѵ�
UPDATE PLAYER 
SET NICKNAME = 'DBMS2' 
WHERE TEAM_ID = 'K01' AND POSITION = 'MF' 
AND BIRTH_DATE >= TO_DATE('1985-01-01 00:00:00','yyyy-MM-dd HH24-MI-ss') AND BIRTH_DATE <= TO_DATE('1985-12-31 23:59:59','yyyy-MM-dd HH24-mi-SS');

--DELETE ����
--�����Ҷ��� �ڽ� ���̺� ���� �����Ѵ�
--lecture ���̺��� seq�� ������ �ʰ��� ��� �ʰ��� �л��� ����
DELETE FROM LECTURE WHERE SUBID = '1107' AND LISTSEQ > 30; 
--PLAYER ���̺��� POSITION�� MF�� ���������ϱ�
DELETE FROM PLAYER WHERE POSITION = 'MF';
--PLAYER ���̺��� Ű�� 180�̻��� ���� ����
DELETE FROM PLAYER WHERE HEIGHT >= 180;

--�÷��� ��Ī �ֱ�
--��Ī�� ���Ⱑ �ִ� ��� ' '�� �����ֱ�
SELECT PLAYER_NAME AS NAME, NICKNAME AS ���� FROM PLAYER; 

--���̺� ��Ī �ֱ�
--�� ���̺��� �Ѳ����� �����͸� �����ö� �÷��� ��� ���̺� �����ִ��� �������� �ϴµ� �̶� ��Ī�� �̿��Ѵ�
--���ϱ�Ǽ� ���´� -> NAME�ϳ��� ��� �ּҰ� ��ġ�Ǽ� ���´�
SELECT P.PLAYER_NAME, T.ADDRESS FROM PLAYER P, TEAM T;

