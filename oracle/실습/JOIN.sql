--���ϴ� �����Ͱ� ���� ���̺� ����� �ִ�
--�̷��� �������� �����Ͱ� �������� ���´�
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P, TEAM T;

--�� ���̺��� ������ ������ ������
SELECT PLAYER_NAME FROM PLAYER WHERE TEAM_ID = 'K06'; 
SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID = 'K06';

--INNER JOIN
--ANSI
SELECT
   P.PLAYER_NAME, 
   T.TEAM_NAME, 
   T.TEAM_ID 
FROM PLAYER P INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID;
--ORACLE
SELECT
   P.PLAYER_NAME, 
   T.TEAM_NAME, 
   T.TEAM_ID 
FROM PLAYER P, TEAM T 
WHERE P.TEAM_ID = T.TEAM_ID;
select * from emp;

--EMP ���̺��� �����ȣ�� DEPT ���̺��� ���� �˻��ϱ�
--�����ȣ�� EMP�� �ְ� ������ �μ� ���̺� �����ϹǷ� �� �����̺��� ���� -> ���� ���� �������� DEPTNO���� ����
SELECT
   E.EMPNO �����ȣ,
   D.LOC �����̸�
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO; 

--PLAYER ���̺��� ������ ������ ���� ���� ��ȭ��ȣ �˻�
--���� ������ PLAYER ���̺� �ְ� �� ��ȭ��ȣ�� TEAM ���̺� �����Ƿ� �� �� ���̺��� ���� -> �� ���̺��� ���� �������� TEAM_ID�� ����
--�̶� ������ ���̺� ������ ������ �����;��Ѵ�
--���� �� �������� �ɷ����� �ǰ� �������� �����ص� �ȴ�
SELECT
   P.PLAYER_NAME �����̸�,
   T.TEL ��ȭ��ȣ
FROM PLAYER P INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
WHERE P.PLAYER_NAME = '������';
--on������ ������ �� �� �ִ� -> ���ʿ� �������� join -> �� ȿ�����̳� �������� ���ؼ��� where��
SELECT 
   T.TEAM_NAME ���̸�, 
   P.PLAYER_NAME �����̸�, 
   T.DDD || ')' || T.TEL ����ȣ 
FROM TEAM T INNER JOIN PLAYER P ON P.TEAM_ID = T.TEAM_ID AND P.PLAYER_NAME = '������';

--JOBS ���̺��� JOB_ID�� EMPLOYEES�� Ǯ����, ������ �˻�
--EMPLOYEES���� ��� �̸��� �������� �̵��� ������ �������� JOBS ���̺��� ������ -> �� ���̺��� ���� �������� JOB_ID�� ����
SELECT 
   J.JOB_TITLE ������,
   E.FIRST_NAME || E.LAST_NAME �ó���
FROM JOBS J INNER JOIN EMPLOYEES E ON J.JOB_ID = E.JOB_ID; 

--T_STUDENT ���̺�� T_DEPARTMANT ���̺��� �л��̸�, 1������ �а���ȣ, 1���� �а��̸� �˻�
--�л��̸��� T_STUDENT�� �ְ� �� �л��� ���� ������ T_DEPARTMENT ���̺� �ִ� -> �� ���̺��� ���� �������� DEPTNO�� ����
SELECT
   S.NAME �л��̸�,
   D.DEPTNO �а���ȣ,
   D.DNAME �а��̸�
FROM T_STUDENT S INNER JOIN T_DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO;

--T_STUDENT ���̺�, T_PROFESSOR ���̺�� JOIN
--�л��̸�, �������� ��ȣ, �������� �̸� �˻� (������ Ȯ��)
--������ : STUDENT ���̺��� �ܷ�Ű�� ���� ��� �� ���� �����ϰ� �����Ѵ�
--        -> �ܺ��������� ������ ����Ű�� �ܷ�Ű�� ��� �����ؼ� �����Ͱ� ������ �Ѵ�
SELECT
   S.NAME �л��̸�,
   P.PROFNO ������ȣ,
   P.NAME �����̸�
FROM T_STUDENT S INNER JOIN T_PROFESSOR P ON S.PROFNO = P.PROFNO;

--�� ����
--3�� ���̺� ����
--���̺���� �����ؼ� �ٿ� ���� ���̺��� �� ���� �����Ͱ����� ���������� �����ϸ� �ȴ�
--������� EMP�� SALGRADE�� ������ ���̺��� SAL=800�� ���� LASAL(700)�� HISAL(1200)�� ������ ���� ���ǿ� �����ϸ� �����Ѵ�
--�̷��� ������ ���̺� ���� ������� DEPT�� �����Ѵ�
SELECT * FROM EMP;
SELECT * FROM SALGRADE;
SELECT 
   E.EMPNO �����ȣ, 
   E.ENAME ����̸�, 
   E.SAL �޿�, 
   S.GRADE ���, 
   D.DNAME �μ���
FROM EMP E 
   INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
   INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

--EMPLOYEES ���̺��� HIREDATE�� 1993~1995���� ��� �˻�
--�̸� �μ��� �Ի糯¥ (�Ի糯¥ ������������ ����)
--�̸� �Ի糯¥�� EMPLAYEES ���̺� �ְ� �μ����� DEPARTMENT ���̺� �ִ� -> ���� �������� DEPARTMENT_ID�� ����
SELECT 
   E.FIRST_NAME || E.LAST_NAME ����̸�,
   D.DEPARTMENT_NAME �μ���,
   E.HIRE_DATE �Ի糯¥
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.HIRE_DATE BETWEEN TO_DATE('1993-01-01','yyyy-MM-DD') AND TO_DATE('1995-12-31','yyyy-MM-DD')
ORDER BY E.HIRE_DATE ASC;
--TO_CHAR(�ð�������,'YYYY')
--ORDER BY�� ������ ���� �� ������ �ִ� �÷����� �����Ѵ�
SELECT 
   E.FIRST_NAME || E.LAST_NAME ����̸�,
   D.DEPARTMENT_NAME �μ���,
   TO_CHAR(E.HIRE_DATE, 'YYYY/MM/DD') �Ի糯¥
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE TO_CHAR(E.HIRE_DATE,'YYYY') BETWEEN '1993' AND '1995'
ORDER BY 3; 

--OUTER JOIN
--LEFT�� STUDENT���̺� ��ο� ���� RIGHT�� ���� ���̺� ��ο� ����
SELECT
   S.NAME �л��̸�,
   NVL(P.PROFNO,000) ������ȣ,
   NVL(P.NAME,'��������') ����������
FROM T_STUDENT S
   LEFT OUTER JOIN T_PROFESSOR P ON S.PROFNO = P.PROFNO;
   
--STADIUM ���̺��� ����� �̸� �¼��� Ȩ���� �˻�
--Ȩ���� ���� ��� Ȩ���������� ���
--STADIUM�� Ȩ���� �����Ƿ� Ȩ������ ��Ÿ��� ���� ©���� ���� ��Ÿ����� ��� ���� �����ؾ��ϱ� ������ LEFT
SELECT * FROM STADIUM;
SELECT * FROM TEAM;
SELECT
   S.STADIUM_NAME "����� �̸�",
   S.SEAT_COUNT �¼���,
   NVL(T.TEAM_NAME,'Ȩ������') Ȩ���̸�
FROM STADIUM S LEFT OUTER JOIN TEAM T ON S.HOMETEAM_ID = T.TEAM_ID;

--NATURAL JOIN
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;
--���� ��İ� �޸� ���� ���Ǿ��� ������ �����ϴ�
--SELECT * ������ �� ���̺��� �ߺ� �÷��� ����� �� ������ ����ϸ� �ϳ��� ���
SELECT * FROM EMP E NATURAL JOIN DEPT D;
--USING�� ����ϴ� ��� �ߺ� �÷��� �̸��� Ÿ���� ��� ���ƾ��Ѵ�
SELECT * FROM EMP JOIN DEPT USING(DEPTNO);

--CROSS JOIN 
SELECT * FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;


--���� ����
SELECT 
   E1.ENAME �����,
   E2.ENAME �Ŵ�����
FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO;

--T_DEPT2 ���̺��� �μ��� �� ���� �μ� ���
SELECT * FROM T_DEPT2;
SELECT 
   D1.DCODE �μ���ȣ,
   D1.DNAME �μ���,
   NVL(D2.DNAME,'�ֻ����μ�') �����μ���
FROM T_DEPT2 D1 LEFT OUTER JOIN T_DEPT2 D2 ON D1.PDEPT = D2.DCODE;

--T_PROFESSOR ���̺��� ������ȣ �����̸� �Ի��� �Ի��� �ڱ⺸�� ���� ����� �ο���
--1. ���� :P1 ��� : P2
--2. SELECT�� �ۼ�
--������ �����ʹ� ���� ���̺��� �������� COUNT�� ��� ���̺��� �����´�
--3. COUNT�� �� �ϳ��� �����´� -> GROUP
--COUNT�� �׷����� ���� ���� ���� �����ʹ� ������ ���´� -> ���� �����͵� �׷����� ���� ����Ѵ�
--4. P2.HIREDATE->*�� �����ö��� �� OUTER���� -> NULL�ΰ� �����ϴ°� �����Ϸ��� 
SELECT
   P1.PROFNO ������ȣ,
   P1.NAME �����̸�,
   P1.HIREDATE �Ի���,
   COUNT(P2.HIREDATE) "���� �Ի��� ���"
FROM T_PROFESSOR1 P1 LEFT OUTER JOIN T_PROFESSOR P2 ON P1.HIREDATE > P2.HIREDATE
GROUP BY P1.PROFNO, P1.NAME, P1.HIREDATE;


���� ���� ����
1. NESTED LOOP JOIN
���� �⺻���� ����
���� ���� ���̺��� �� ����ŭ JOIN�� ����
���� ���̺�(DRIVING TABLE)�� JOIN�� ������ �����Ѵ�
���� ���̺�(DRIVEN TABLE)�� ���߿� ���� ���̺��� �ǹ��Ѵ�
2. SORT-MERGE JOIN
�˻��� �� �˻� ���� WHERE������ �������� �����Ѵ�
�����ҋ� �ð��� �ſ� ���� �ɸ����� �ε����� �������� ������ ���� �ش� �����͸� ã�Ƽ� ����� ����� �� �ִ�
3.HASH-JOIN
�ε����� �ֱ⶧���� SORT-MERGER JOIN���� 2�� �̻� ���� �ӵ��� �˻��� �����ϴ�


