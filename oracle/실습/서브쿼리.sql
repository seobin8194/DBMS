--SELECT���� �������� �ۼ�
--��ü ��� �޿��� �ึ�� ����Ͽ� �ڽ��� �޿��� ���ϰ� ������
SELECT
   PROFNO ������ȣ,
   NAME �����̸�,
   ��ձ޿�
FROM T_PROFESSOR;
--��ձ޿��� �׷��Լ��̰� �� �޿��� �Ϲ� �÷��̱� ������ ���� �˻� �Ұ�
--��ձ޿��� ���������� �ۼ�
SELECT AVG(PAY) FROM T_PROFESSOR;
SELECT
   PROFNO ������ȣ,
   NAME �����̸�,
   (SELECT AVG(PAY) FROM T_PROFESSOR) ��ձ޿�
FROM T_PROFESSOR;

--FROM������ �������� �ۼ�
--PLAYER ���̺��� TEAM_ID='K10'�� ���� �߿� POSITION�� GK�� ����
SELECT *
FROM TEAM_ID = 'K10'�� ���� ��
WHERE "POSITION" = 'GK';
--������ ���̺��� ����� �������� ������
--TEAM_ID='K01'�� ���� ��
SELECT * FROM PLAYER WHERE TEAM_ID = 'K10';
SELECT *
FROM (SELECT * FROM PLAYER WHERE TEAM_ID = 'K10')
WHERE "POSITION" = 'GK';

--WHERE������ �������� �ۼ�
--PLAYER ���̺��� ���Ű���� Ű�� ���� ����
SELECT *
FROM PLAYER
WHERE HEIGHT < ���Ű;
--WHERE������ �׷��Լ��� ����� �� ����
--���Ű
SELECT AVG(HEIGHT) FROM PLAYER;
SELECT *
FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER);

--�� ����
CREATE VIEW TEST_VIEW AS (SELECT * FROM T_STUDENT WHERE DEPTNO1 = 101);
SELECT * FROM TEST_VIEW;

--�� ����
DROP VIEW TEST_VIEW;

--PLAYER ���̺��� ��ü Ű ��հ� ������ �� ��� Ű ���ϱ�
SELECT
   ������
   ������ �� ���Ű
   ��ü Ű ���
FROM PLAYER GROUP BY "POSITION";
--�׷��Լ��� �Ϲ� �÷��� �Բ� �˻��� �� ����
--��ü Ű ���
SELECT AVG(HEIGHT) FROM PLAYER;
SELECT
   POSITION ������,
   AVG(HEIGHT) "������ �� ���Ű",
   (SELECT AVG(HEIGHT) FROM PLAYER) "��ü Ű ���"
FROM PLAYER 
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

--PLAYER ���̺��� NICKNAME�� NULL�� �������� ���¹� ������ �г������� �ٲٱ�
UPDATE PLAYER
SET NICKNAME = ���¹μ����� �г���
WHERE NICKNAME IS NULL;
--���¹μ����� �г���
SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '���¹�';
UPDATE PLAYER
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '���¹�')
WHERE NICKNAME IS NULL;

--EMPLOYEES ���̺��� ��� �޿����� ���� ������� �޿��� 10���� �λ��Ű��
SELECT * FROM EMPLOYEES;
UPDATE EMPLOYEES 
SET SALARY = 10���� �λ�
WHERE SALERY < ��ձ޿�;
--��ձ޿�
SELECT AVG(SALARY) FROM EMPLOYEES;
UPDATE EMPLOYEES 
SET SALARY = SALARY + SALARY*0.1
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

--PLAYER ���̺��� ���Ű���� ū ���� ����
DELETE FROM PLAYER WHERE HEIGHT > ���Ű;
--���Ű
SELECT AVG(HEIGHT) FROM PLAYER;
DELETE FROM PLAYER WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

--������ ������ ���� ���� ������ �˻�
SELECT * FROM PLAYER WHERE TEAM_ID = �������� ���� ���� ���̵�;
--�������� ���� ���� ���̵�
SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������';
SELECT * 
FROM PLAYER 
WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������');

--������ ������ ���� ���� ������ ����
SELECT *
FROM PLAYER
WHERE TEAM_ID = �������� ���� ���� ���̵�;
--�������� ���� ���� ���̵�
SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������';
--��ȣ�� �ε�ȣ�� �����ʿ��� ���� ������ �Ѱ����� �Ѵ�
--���� ��ȣ�� �ƴ� IN���� �񱳸� �ؾ��Ѵ�
--���� ���� ������ ���� �ۼ��Ͽ� �����غ��� ��ü ������ �ۼ�
SELECT *
FROM PLAYER
WHERE TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������');

--����� �� ������ 20120501 ~ 20120503 ���̿� �ִ� �����
SELECT * FROM STADIUM;
SELECT * FROM SCHEDULE;
SELECT
   STADIUM_ID,
   STADIUM_NAME
FROM STADIUM
WHERE STADIUM_ID = 20120501 ~ 20120503 ���̿� �ִ� ����� ���̵�;
--20120501 ~ 20120503 ���̿� �ִ� ����� ���̵�
SELECT STADIUM_ID, SCHE_DATE FROM SCHEDULE WHERE SCHE_DATE BETWEEN '20120501' AND '20120503';
SELECT
   STADIUM_ID "����� ���̵�",
   STADIUM_NAME "����� �̸�"
FROM STADIUM 
WHERE STADIUM_ID IN (SELECT STADIUM_ID FROM SCHEDULE WHERE SCHE_DATE BETWEEN '20120501' AND '20120503');

--�ռ��� ������ ������ ���� ������ �˻��Ͽ� �� ���̵�� ����
SELECT *
FROM PLAYER
WHERE BIRTH_DATE = �ϼ��� ���� ����
ORDER BY TEAM_ID ASC;
--�ϼ��� ���� ����
SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME = '�ռ���';
SELECT *
FROM PLAYER
WHERE BIRTH_DATE = (SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME = '�ռ���')
ORDER BY TEAM_ID ASC;

--������ �л��� ���� �� �������� �޿����� �޿��� �� �޴� ������ �˻�
SELECT *
FROM T_PROFESSOR
WHERE PAY > ������ �л��� ���� �� �������� �޿�;
--������ �л��� ���� �� �������� �޿�
SELECT PAY FROM T_PROFESSOR WHERE DEPTNO = ������ �л��� ���� �� AND "POSITION" = '������';
--������ �л��� ���� ��
SELECT DEPTNO1 FROM T_STUDENT WHERE NAME = '������';
--������ �л��� ���� �� �������� �޿�
SELECT PAY FROM T_PROFESSOR WHERE DEPTNO = (SELECT DEPTNO1 FROM T_STUDENT WHERE NAME = '������') AND "POSITION" = '������';
SELECT *
FROM T_PROFESSOR
WHERE PAY > (SELECT PAY FROM T_PROFESSOR WHERE DEPTNO = (SELECT DEPTNO1 FROM T_STUDENT WHERE NAME = '������') AND "POSITION" = '������');

--�� ������ ����� �������� �ʰ� �¾ ������ �� �˻�
SELECT
   COUNT(*)
FROM PLAYER
WHERE BIRTH_DATE > ����� ���� ����
GROUP BY TEAM_ID;
--����� ���� ����
SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME = '�����';
SELECT
   TEAM_ID "�� ���̵�",
   COUNT(*) "������ ��"
FROM PLAYER
WHERE BIRTH_DATE > (SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME = '�����')
GROUP BY TEAM_ID;

--DEN�� ��ȭ��ȣ �� 3�ڸ��� ���� ����� �˻�(EMPLOYEES)
SELECT *
FROM EMPLOYEES
WHERE ��ȭ��ȣ �� 3�ڸ� = DEN�� ��ȭ��ȣ �� 3�ڸ�;
SELECT * FROM EMPLOYEES;
--��ȭ��ȣ �� 3�ڸ�
SELECT SUBSTR(PHONE_NUMBER,1,3) FROM EMPLOYEES;
--DEN�� ��ȭ��ȣ �� 3�ڸ�
SELECT SUBSTR(PHONE_NUMBER,1,3) FROM EMPLOYEES WHERE FIRST_NAME = 'Den';
SELECT *
FROM EMPLOYEES
WHERE SUBSTR(PHONE_NUMBER,1,3) = (SELECT SUBSTR(PHONE_NUMBER,1,3) FROM EMPLOYEES WHERE FIRST_NAME = 'Den');
--���2
SELECT *
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE (SELECT SUBSTR(PHONE_NUMBER,1,3) FROM EMPLOYEES WHERE FIRST_NAME = 'Den') || '%';

--STADIUM ���̺��� ����� �̸��� Ȩ���� �¼��� �������� ��� �¼� �˻�
SELECT * FROM STADIUM;
SELECT * FROM TEAM;
SELECT
   S.STADIUM_NAME "����� �̸�",
   S.SEAT_COUNT "�¼� ��",
   T.TEAM_NAME Ȩ����,
   �������� ����¼� �� 
FROM STADIUM S JOIN TEAM T ON S.HOMETEAM_ID = T.TEAM_ID;
--�������� ����¼� ��
SELECT AVG(SEAT_COUNT) FROM STADIUM;
SELECT
   S.STADIUM_NAME "����� �̸�",
   S.SEAT_COUNT "�¼� ��",
   NVL(T.TEAM_NAME,'����') Ȩ����,
   (SELECT AVG(SEAT_COUNT) FROM STADIUM) "����¼� ��" 
FROM STADIUM S LEFT OUTER JOIN TEAM T ON S.HOMETEAM_ID = T.TEAM_ID;
--���2
SELECT
   S.STADIUM_NAME "����� �̸�",
   S.SEAT_COUNT "�¼� ��",
   NVL((SELECT T.TEAM_NAME FROM TEAM T WHERE S.HOMETEAM_ID = T.TEAM_ID),'����') Ȩ����,
   (SELECT AVG(SEAT_COUNT) FROM STADIUM) "����¼� ��" 
FROM STADIUM S;

--������ �߿��� Ű�� ��պ��� �۰� �����Դ� ��պ��� ���� ���� �˻�
SELECT *
FROM PLAYER
WHERE HEIGHT < ��� Ű AND WEIGHT > ��� ������;
--��� Ű
SELECT AVG(HEIGHT) FROM PLAYER;
--��� ������
SELECT AVG(WEIGHT) FROM PLAYER;
SELECT *
FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER) AND WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);

--�̸��� L�� �ִ� ������� �μ���� ���� �˻� (EMP�� DEPT ���̺� ����)
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT
   E.ENAME �̸�,
   D.DNAME �μ���,
   D.LOC ����
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME LIKE '%L%';

SELECT
   DNAME,
   LOC
FROM DEPT
WHERE DEPTNO = �̸��� L�� �ִ� ������� �μ���;
--�̸��� L�� �ִ� ������� �μ� ���̵�
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%L%';
SELECT
   DNAME �μ���,
   LOC ��ġ
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%L%');

--JOB TITLE �߿� MABAGER�� ���ڿ��� ���ԵǴ� �������� ��� ������ JOB TITLE ���� �˻�
SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;
SELECT
   J.JOB_TITLE,
   AVG(E.SALARY)
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE LIKE '%Manager%'
GROUP BY J.JOB_TITLE;

--������ �߿��� �� ������ Ű�� ū ������ �˻�
SELECT * FROM PLAYER;
SELECT * FROM TEAM;
--�� ���� ���� ū Ű
SELECT TEAM_ID, MAX(HEIGHT)FROM PLAYER GROUP BY TEAM_ID;
--SELECT������ ����� ���� ���̺�� �����Ѵ�
SELECT *
FROM PLAYER P 
   JOIN (SELECT TEAM_ID, MAX(HEIGHT) MH FROM PLAYER GROUP BY TEAM_ID) A 
      ON P.TEAM_ID = A.TEAM_ID AND P.HEIGHT = A.MH;
      
--������ �߿� �迵�� ������ �迵�� �������� �Ի����� ������ �޿��� ���� �������� PROFNO NAME PAY �˻�
SELECT * FROM T_PROFESSOR;
SELECT
   PROFNO,
   NAME,
   PAY
FROM T_PROFESSOR
WHERE PROFNO = �迵�� ���� ���̵��̰ų� �迵�� �������� �Ի����� ������ �޿��� ���� ������ ���̵�;
--�迵�� ���� ���̵��̰ų� �迵�� �������� �Ի����� ������ �޿��� ���� ������ ���̵�
SELECT PROFNO
FROM T_PROFESSOR
WHERE HIREDATE >= �迵�� �Ի��� AND PAY >= �迵�� �޿�;
--�迵�� �Ի���
SELECT HIREDATE FROM T_PROFESSOR WHERE NAME = '�迵��';
--�迵�� �޿�
SELECT PAY FROM T_PROFESSOR WHERE NAME = '�迵��';
--�迵�� ���� ���̵��̰ų� �迵�� �������� �Ի����� ������ �޿��� ���� ������ ���̵�
SELECT PROFNO
FROM T_PROFESSOR
WHERE HIREDATE >= (SELECT HIREDATE FROM T_PROFESSOR WHERE NAME = '�迵��') AND PAY >= (SELECT PAY FROM T_PROFESSOR WHERE NAME = '�迵��');
SELECT
   PROFNO ������ȣ,
   NAME �̸�,
   PAY �޿�,
   HIREDATE �Ի���
FROM T_PROFESSOR
WHERE PROFNO IN 
   (SELECT PROFNO 
    FROM T_PROFESSOR 
    WHERE HIREDATE >= (SELECT HIREDATE FROM T_PROFESSOR WHERE NAME = '�迵��') 
       AND PAY >= (SELECT PAY FROM T_PROFESSOR WHERE NAME = '�迵��')
    );

--PLAYER ���̺��� ���� �ִ� �������� ������ TEAM_ID REGION_NAME PLAYER_NAME WEIGHT �˻�
SELECT * FROM PLAYER;
SELECT * FROM TEAM;
--�� �� �ִ� ������
SELECT TEAM_ID, MAX(WEIGHT) FROM PLAYER GROUP BY TEAM_ID;
--���� �ִ�� �����Ը� ���� ���� ���̺Ұ� �����ϰ� �����̸��� �˻��ϱ� ���ؼ� �� ���̺���� �����Ѵ�
SELECT 
   P.TEAM_ID �����̵�,
   P.PLAYER_NAME �����̸�,
   P.WEIGHT ������,
   T.REGION_NAME �����̸�   
FROM PLAYER P
   JOIN (SELECT TEAM_ID, MAX(WEIGHT) MW FROM PLAYER GROUP BY TEAM_ID) A ON P.TEAM_ID = A.TEAM_ID AND P.WEIGHT = A.MW
   JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID;

--DEPT ���̺��� LOC�� �� �޿� �� ��� �޿��� �ݿø��� ���� ��ü ����� ��� �޿� �˻�
SELECT * FROM DEPT;
SELECT * FROM EMP;
--��ü ����� ��� �޿�
SELECT AVG(SAL) FROM EMP;
--DEPT�� EMP�� ������ ���̺��� LOC���� �׷����Ͽ� LOC�� ��� ������ �˻��Ѵ�
SELECT 
    D.LOC ��ġ,
    SUM(E.SAL) "�� �޿�",
    ROUND(AVG(E.SAL)) "��� �޿�",
    (SELECT AVG(SAL) FROM EMP) "��ü �޿� ���"
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY LOC;

--EMP ���̺��� HIREDATE�� FORD�� �Ի�⵵�� ���� ��� ��ü ���� �˻�
SELECT * FROM EMP;
SELECT *
FROM EMP
WHERE HIREDATE = FORD�� �Ի�⵵;
--FORD�� �Ի�⵵
SELECT HIREDATE FROM EMP WHERE ENAME = 'FORD';
SELECT * FROM EMP;
SELECT *
FROM EMP
WHERE HIREDATE = (SELECT HIREDATE FROM EMP WHERE ENAME = 'FORD');

--T_EMP2���� ������ ������ ����� �ּ� �����ں��� �޿��� ���� �޴� ������ �̸� ���� �޿� �˻�(TO_CHAR ���� �̿��ؼ� ,�ְ� �ڿ� �� ���̱�)
SELECT 
   NAME,
   POST,
   PAY
FROM T_EMP2
WHERE PAY > ������ ������ ����� �ּ� ������ �޿�;
--������ ������ ����� �ּ� ������ �޿�
SELECT MIN(PAY) FROM T_EMP2 WHERE POST = '����'; 
SELECT 
   NAME �̸�,
   POST ����,
   TO_CHAR(PAY,'999,999,999') || '��' �޿�
FROM T_EMP2
WHERE PAY > ANY(SELECT PAY FROM T_EMP2 WHERE POST = '����');

--4�г� �л����� �ּ� �����Ժ��� �����԰� �� ������ �л��� �̸� �г� ������
--4�г� �л����� ������
SELECT WEIGHT FROM T_STUDENT WHERE GRADE = 4;
--��� 4�г� �л����� �����Ժ��� ������ �ȴ�
SELECT 
   NAME �̸�,
   GRADE �г�,
   WEIGHT ������
FROM T_STUDENT
WHERE WEIGHT < ALL(SELECT WEIGHT FROM T_STUDENT WHERE GRADE = 4);

--�ڽ��� ������ ��� �޿����� ���ų� ���� �޴� ������ �̸� ���� �޿� �˻�
SELECT * FROM T_EMP2;
SELECT
    EMPNO,
    NAME,
    POST,
    PAY
FROM T_EMP2
WHERE PAY > ���� ���� ��ձ޿�;
--���޺� ��� �޿�
SELECT POST, AVG(PAY) FROM T_EMP2 GROUP BY POST;
--���޺� ��ձ޿��� �˻��� ���̺��� �����ϰ� ���� ���̺��� �޿��� ������� �޿����� ������ �ɷ�����
SELECT
    E.EMPNO ���̵�,
    E.NAME �̸�,
    NVL(E.POST,'����') ����,
    E.PAY �޿�
FROM T_EMP2 E FULL OUTER JOIN (SELECT POST, AVG(PAY) AP FROM T_EMP2 GROUP BY POST) A ON NVL(E.POST,'����') = NVL(A.POST,'����')
WHERE E.PAY >= A.AP;

--EXISTS
SELECT * FROM EMP WHERE SAL IN (SELECT SAL FROM EMP WHERE DEPTNO = 20);
--��� ������ �� ��µȴ� -> �ึ�� ������ �˻��ϰ� �����ϸ� ���
SELECT * FROM EMP WHERE EXISTS (SELECT SAL FROM EMP WHERE DEPTNO = 20);

--INSERT �������ϱ�
--�� ���� SELECT �ƹ��ų� ���;��Ѵ�
INSERT ALL
   INTO ���̺� VALUES()
   INTO ���̺�B VALUES()
   INTO ���̺�B VALUES()
SELECT * FROM DUAL;

--VALUE ��� �������� �ۼ� ���� 
INSERT INTO ���̺�(SELECT FROM WHERE);

--���̺� ���� 2��� �ø���
--���� ������(���� ������)�����
INSERT INTO ���̺� (SELECT * FROM ���̺�);
SELECT * FROM PLAYER WHERE TEAM_ID = 'K04' AND "POSITION" = 'DF';

--UNION
(SELECT * FROM PLAYER WHERE TEAM_ID = 'K04')
UNION
(SELECT * FROM PLAYER WHERE "POSITION" = 'DF');
--UNION ALL
(SELECT * FROM PLAYER WHERE TEAM_ID = 'K04')
UNION ALL
(SELECT * FROM PLAYER WHERE "POSITION" = 'DF');