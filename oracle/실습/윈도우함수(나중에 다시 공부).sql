--������ �Լ�
--SELECT �÷�1,�÷�2,,,,, �׷��Լ�(�÷�) OVER (PARTITION BY �÷���) FROM ���̺�
--�׷��Լ� �����Ϳ� �׳� �����͸� �Բ� ����Ҷ� �׷��� ����ϸ� �׳� �����͵�ε� �׷����� ��������Ѵ�
SELECT * FROM EMPLOYEES;
SELECT
   FIRST_NAME || LAST_NAME
   DEPARTMENT_ID,
   SUM(SALARY) 
FROM EMPLOYEES GROUP BY DEPARTMENT_ID,FIRST_NAME,LAST_NAME;

SELECT
   FIRST_NAME || LAST_NAME,
   DEPARTMENT_ID �μ���ȣ,
   SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID) 
FROM EMPLOYEES;

SELECT
   ENAME,
   SAL,
   RANK() OVER (ORDER BY SAL) �μ����ѱ޿�
FROM EMP;

SELECT
   ENAME,
   SAL,
   JOB,
   RANK() OVER (PARTITION BY JOB ORDER BY SAL) ����������,
   ROW_NUMBER() OVER (PARTITION BY JOB ORDER BY SAL) ���ȣ
FROM EMP;

SELECT 
   ENAME,
   SAL,
   FIRST_VALUE(ENAME) OVER (PARTITION BY DEPTNO)
FROM EMP;

--LAG:���� �� LEAD:������� ������
--2��° �μ� : 2��° �� ���� ����
--3��° �μ� :NULL�� ��� ��ü ����
SELECT 
   ENAME,
   SAL,
   LAG(ENAME,2,'X') OVER (ORDER BY DEPTNO) ������,
   LEAD(ENAME,2,'X') OVER (ORDER BY DEPTNO) ������
FROM EMP;








