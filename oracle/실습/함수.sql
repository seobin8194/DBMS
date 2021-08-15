--NULL ó���Լ�
--PLAYER ���̺��� �����̸�, Ű, ������(NULL�̸� '�̵��')
--�� �÷��� ���� ������ Ÿ���� ����� �� �����Ƿ� �Լ��� �̿��� ������ Ÿ���� �����ؾ��Ѵ�
SELECT 
   PLAYER_NAME �̸�,
   NVL(TO_CHAR(HEIGHT),'�̵��') Ű,
   NVL(TO_CHAR(WEIGHT),'�̵��') ������
FROM PLAYER;
SELECT 
   PLAYER_NAME �̸�,
   NVL2(HEIGHT,TO_CHAR(HEIGHT),'�̵��') Ű,
   NVL2(WEIGHT,TO_CHAR(HEIGHT),'�̵��') ������
FROM PLAYER;
SELECT 
   PLAYER_NAME �̸�,
   CASE
      WHEN HEIGHT IS NULL THEN '�̵��'
      ELSE TO_CHAR(HEIGHT)
    END Ű,
    CASE
      WHEN WEIGHT IS NULL THEN '�̵��'
      ELSE TO_CHAR(WEIGHT)
    END ������   
FROM PLAYER;
--PLAYER ���̺��� POSITION �˻�
--POSITION�� NULL�̸� �������� ���
SELECT
   PLAYER_NAME �����̸�,
   NVL(POSITION,'����') ������
FROM PLAYER;
--PLAYER ���̺��� �̸� ���� �˻�
--������ NULL�̸� �̸��� ������ ���
SELECT
   NVL2(NICKNAME,PLAYER_NAME || '-' || NICKNAME,PLAYER_NAME) "PLAYER"
FROM PLAYER;

--CONCAT()
SELECT CONCAT('FLO','WER') FROM DUAL;
SELECT CONCAT(PLAYER_NAME,' : ' || NICKNAME) FROM PLAYER;

--UPPER LOWER INITCAP
SELECT UPPER('korea') FROM DUAL;
SELECT LOWER('KOREA') FROM DUAL;
SELECT INITCAP('KOREA') FROM DUAL;

--LENGTH LENGTHB
SELECT LENGTH('������') FROM DUAL;
SELECT LENGTHB('������') FROM DUAL;
--PLAYER ���̺��� �̸��� 2������ ���� �˻�
SELECT * FROM PLAYER WHERE LENGTH(PLAYER_NAME) = 2;

--SUBSTR
--T_STUDENT���� 1������ 101���� �л��� �̸� ������� ���
SELECT
   NAME �л��̸�,
   SUBSTR(JUMIN,1,6) �������
FROM T_STUDENT
WHERE DEPTNO1 = '101';
--T_STUDENT���� 8������ �̸� ������� ���
SELECT
   NAME �л��̸�,
   SUBSTR(JUMIN,1,6) �������
FROM T_STUDENT
WHERE SUBSTR(JUMIN,3,2) = '08';
--T_STUDEBT ���� ���л��� �̸� �ֹι�ȣ ���
SELECT
   NAME �л��̸�,
   JUMIN �ֹι�ȣ
FROM T_STUDENT
WHERE SUBSTR(JUMIN,7,1) = '2';

--INSTRING
SELECT INSTR('A*B*C','*',1,2) FROM DUAL;

--LPAD RPAD
SELECT LPAD('ABCD',10,'*') FROM DUAL;
SELECT RPAD('ABCD',10,'*') FROM DUAL;
--�ֹι�ȣ ���ڸ� ����
SELECT RPAD(SUBSTR('9811011234567',1,6),13,'*') FROM DUAL;
--T_STUDENT ���̺��� 1������ 101���� �л��� ID�� �� 10���ڷ� ä���� �˻� (���ڸ��� �ƹ� ��ȣ)
SELECT RPAD(ID,10,'*') FROM T_STUDENT WHETE DEPTNO1 = 101;

--REPLACE
SELECT REPLACE('���۸�, ���ۿ��','����','SUPER') FROM DUAL;
--PLAYER ���̺��� �������� �̸��� ���κи� #���� �ٲ㼭 ���
SELECT REPLACE(PLAYER_NAME,SUBSTR(PLAYER_NAME,1,1),'#') FROM PLAYER;
--T_STUDENT ���̺��� 102�� �а��� �л����� �̸� ,��ȭ��ȣ�� ����ϵ� ��ȭ��ȣ�� 02-###-2807�� ���
SELECT
   NAME �̸�,
   DEPTNO1 �а���ȣ,
   REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')') + 1,INSTR(TEL,'-') - INSTR(TEL,')') - 1),"***") ��ȭ��ȣ
FORM T_STUDENT
WHERE DEPTNO1 = 102;

--�����Լ�
SELECT ABS(-10) FROM DUAL;
SELECT MOD(10,3) FROM DUAL;
SELECT CEIL(3.14),CEIL(-3.14) FROM DUAL;
SELECT FLOOR(3.14), FLOOR(-3.14) FROM DUAL;
SELECT ROUND(3.4564574), ROUND(3.8564543) FROM DUAL;
--�Ҽ� 2°�ڸ����� ��Ÿ���� -> �Ҽ� 3°�ڸ����� �ݿø�
SELECT ROUND(3.1414214,2) FROM DUAL;
--�ι��� �μ��� ������ ������ �����κп��� �ݿø� 
SELECT ROUND(3288.1141421,-2) FROM DUAL;
SELECT TRUNC(3.9),TRUNC(-3.9) FROM DUAL;
SELECT POWER(3,2) FROM DUAL;
--��Ʈ
SELECT POWER(2,POWER(2,-1)) FROM DUAL;

--��¥�Լ�
--����
SELECT SYSDATE + 1 FROM DUAL;
--1�ð� ��
SELECT SYSDATE + 1/24 FROM DUAL;
--������ �������� �ݿø�
SELECT ROUND(SYSDATE) FROM DUAL;
--�ð� ����
SELECT TRUNC(SYSDATE) FROM DUAL;
--���� ����
SELECT TRUNC(MONTHS_BETWEEN(TO_DATE('11-21-1995','MM-DD-YYYY'), TO_DATE('12-21-1995','MM-DD-YYYY'))) FROM DUAL;
--T_PROFESSOR ���̺��� ������ �������� �ټӳ�� �ټӰ��� �ټ����� ����Ͽ� Ǯ��
--�ټ� ���� �ټ� ���� �Ҽ��� 1�ڸ�
SELECT
   NAME �̸�,
   TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) �ټӿ���,
   ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),1) �ټӰ���,
   ROUND(SYSDATE-HIREDATE,1) �ټ��ϼ�   
FROM T_PROFESSOR;
--�̹� ���� ������ ��¥
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--�׷��Լ�
SELECT COUNT(PLAYER_NAME) FROM PLAYER;
SELECT AVG(HEIGHT),MAX(HEIGHT),MIN(HEIGHT),SUM(HEIGHT) FROM PLAYER;