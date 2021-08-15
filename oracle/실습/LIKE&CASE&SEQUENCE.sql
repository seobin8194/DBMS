--���� ���� ����
--���� ���̺��� �� ��ȣ, �������� �˻�
SELECT BACK_NO "�� ��ȣ", NICKNAME ���� FROM PLAYER;
--���� ���̺��� �Ҽ��� �ڵ�, �� ���̺��� �� �̸� �˻�
SELECT P.TEAM_ID ���ڵ�, T.TEAM_NAME ���̸� FROM PLAYER P, TEAM T;
--����� ���̺��� �¼��� 30000�̻� 50000������ ����� �̸��� �ּ� �˻�
SELECT STADIUM_NAME "����� �̸�", ADDRESS "�ּ�", SEAT_COUNT "�¼� ��" FROM STADIUM WHERE SEAT_COUNT BETWEEN 30000 AND 50000;

--���� ����
--���� ���̺��� �̸��� ������ �˻�
--��� ���� �ϳ��� �÷����� ��� (���� ��� ���ټ�(�ΰ��� ����))
SELECT PLAYER_NAME || '(' || NICKNAME || ')' "�̸�(����)" FROM PLAYER;

--LIKE ����
--���� ���̺��� ���� "��"���� ��� �˻�
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '��%';
--T_STUDENT���� ���л��� �˻�
SELECT * FROM T_STAUDENT WHERE JUMIN LIKE '______2______';
--T_EMP ���̺��� �̸��� NE�� ���� �����˻�
SELECT * FROM T_EMP WHERE ENAME LIKE '%NE%';
--T_EMP ���̺��� �̸��� �ι��� ���ڰ� A�� ���� �˻�
SELECT * FROM T_EMP WHERE ENAME LIKE '_A%';

--CASE�� ����
--�������̺��� �������� �� ���
SELECT
   PLAYER_NAME "���� �̸�",
   CASE
      WHEN PLAYER_NAME LIKE '��%' THEN '����'
      WHEN PLAYER_NAME LIKE '��%' THEN '�̾�'
      ELSE '�� ��'
    END "����"
FROM PLAYER;
--EMP ���̺��� �޿��� 3000�̻��̸� HIGH 1000�̻��̸� MID �� �ܴ� LOW
SELECT
   SAL �޿�,
   CASE
      WHEN SAL >= 3000 THEN 'HIGH'
      WHEN SAL >= 1000 THEN 'MID'
      ELSE 'LOW'
    END "�޿����"
FROM EMP;
--STADIUM ���̺��� �¼����� 50001�̻��̸� L 30001�̻� 50000�����̸� M 10001�̻� 300000�����̸� S
SELECT
   SEAT_COUNT �¼���,
   CASE
      WHEN SEAT_COUNT >= 50001 THEN 'L'
      WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'M'
      WHEN SEAT_COUNT BETWEEN 10001 AND 300000 THEN 'S'
    END "���"
FROM STADIUM;

--������ ����
CREATE TABLE TEST (
NUM NUMBER(5) PRIMARY KEY,
"DATA" VARCHAR2(20),
REGDATE DATE DEFAULT SYSDATE
);
CREATE SEQUENCE TEST_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 20;
INSERT INTO TEST(NUM,"DATA") VALUES (TEST_SEQ.NEXTVAL,'HELLO');
INSERT INTO TEST(NUM,"DATA") VALUES (TEST_SEQ.NEXTVAL,'�氡');











