--�׷��Լ��� �Ϲ����� �÷��� �Բ� �˻��� �� ���� -> ���̺��� ��׷�����
--T_EMP ���̺��� �Ŵ���, �� ������, �޿� �Ѿ�, �޿� ���, ����� ��� ���
SELECT
   MGR �Ŵ���,
   COUNT(*) ������,
   SUM(SAL) �޿��Ѿ�,
   AVG(SAL) �޿����,
   AVG(COMM) ��������
FROM T_EMP;
--T_EMP ���̺��� �Ŵ��� ���� �� ������ �޿� �Ѿ� �޿� ��� ����� ���
--��� ���Ҷ� NULL�� ���ԵǾ� ������ �׳� NULL�� ��µǹǷ� NULLó���� �ؾ��Ѵ�
SELECT
   MGR �Ŵ���,
   COUNT(*) ������,
   SUM(SAL) �޿��Ѿ�,
   AVG(NVL(SAL, 0)) �޿����,
   AVG(NVL(COMM,0)) ��������
FROM T_EMP GROUP BY MGR ORDER BY MGR ASC;

--���� -> �׷�
--������ ���� ���� ����� ���Ѵ�
SELECT
   "POSITION" ������,
   AVG(NVL(PAY,0)) �������
FROM T_PROFESSOR GROUP BY "POSITION";
--PLAYER ���̺��� ���Ű ��� �����Ը� �����Ǻ��� �˻�
SELECT
   POSITION ������,
   ROUND(AVG(NVL(HEIGHT,0)),1) || 'CM' ���Ű,
   ROUND(AVG(NVL(WEIGHT,0)),1) || 'KG' ��ո�����
FROM PLAYER 
WHERE "POSITION" IS NOT NULL 
GROUP BY "POSITION" ORDER BY ������ ASC;

--�׷����� ���� �� �׷쳻���� �׷��� ���´�
--T_PROFESSOR���� �а��� ���޺� �������� ��� �޿� ���
--�� 101 ������ ��
SELECT 
   DEPTNO �а�, 
   "POSITION" ����, 
   AVG(PAY) ��ձ޿� 
FROM T_PROFESSOR 
GROUP BY DEPTNO, "POSITION" 
ORDER BY DEPTNO ASC,"POSITION" DESC;

--HAVING��
--WHERE���� �׷����ϱ� ���� ������ �ٶ� �׸��� ��ü�� ������� �ϴ� �����͸� ������ ������ �ɶ� �̿�
--HAVING���� �׷������� ����� �����͸� ������ ������ �ɶ� �̿�
--�а��� ��ճ����� 350�̻� �ΰ� �˻�
SELECT DEPTNO �а�, AVG(PAY) FROM T_PROFESSOR GROUP BY DEPTNO HAVING AVG(PAY) >= 350;

--HAVONG������ ��ü�� ������� �ϴ� �����͸� ������ ���ǵ� �� �� �ִ�
--�׷����� ���� NULL�̸� ����
SELECT "POSITION" FROM PLAYER GROUP BY "POSITION" HAVING "POSITION" IS NOT NULL;
--NULL�̸� �����ϰ� �׷����� ����
--�� ȿ�����̴�
SELECT "POSITION" FROM PLAYER WHERE "POSITION" IS NOT NULL GROUP BY "POSITION";

--EMPLOYEES ���̺��� JOB_ID ����(GROUP) ��� SALERY(HAVING)�� 10000�̸��� SALERY �հ�, ���, �ִ�, �ּ� ��, ��� �� �˻� (job_id �������� �˻�)
SELECT
   JOB_ID ID, 
   AVG(SALARY) ��ձ޿�, 
   SUM(SALARY) �հ�, 
   MAX(SALARY) �ִ�, 
   MIN(SALARY) �ּ�, 
   COUNT(JOB_ID) ����� 
FROM EMPLOYEES 
GROUP BY JOB_ID HAVING AVG(SALARY) < 10000
ORDER BY JOB_ID ASC;
--PLAYER ���̺��� ������(WHERE)�� 80�̻��� �������� ���Ű(HAVING)�� 180�̻��� ������ �˻�
SELECT "POSITION" ������
FROM PLAYER 
WHERE WEIGHT >= 80 
GROUP BY "POSITION" HAVING AVG(HEIGHT) >= 180;
--T_PROFESSOR ���̺��� ������ �������� �������� ��� �߿�(WHERE) ������(GROUP) 
--����ȣ, �Ҽ� ���� �� ��, �ټ��� �� ���, �޿� ���, ���ʽ� ��� �˻�(����ȣ ��������)
SELECT 
   DEPTNO ����ȣ, 
   COUNT(PROFNO) "���� ��", 
   ROUND(AVG(SYSDATE-HIREDATE),1) "�ټ��� �� ���", 
   AVG(PAY) "�޿� ���", 
   AVG(NVL(BONUS,0)) "���ʽ� ���"
FROM T_PROFESSOR 
WHERE "POSITION" IN ('������','������')
GROUP BY DEPTNO
ORDER BY DEPTNO;
--T_STUDENT ���̺��� �а�����(GROUP) �а���ȣ �ִ� �����Կ� �ּ� �������� ���� �˻�
SELECT 
   DEPTNO1 �а���ȣ, 
   MAX(WEIGHT) - MIN(WEIGHT) "������ ����"
FROM T_STUDENT
GROUP BY DEPTNO1
ORDER BY DEPTNO1 ASC;




