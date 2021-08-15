--별명 짓기 연습
--선수 테이블에서 등 번호, 선수별명 검색
SELECT BACK_NO "등 번호", NICKNAME 별명 FROM PLAYER;
--선수 테이블에서 소속팀 코드, 팀 테이블에서 팀 이름 검색
SELECT P.TEAM_ID 팀코드, T.TEAM_NAME 팀이름 FROM PLAYER P, TEAM T;
--경기장 테이블에서 좌석이 30000이상 50000이하인 경기장 이름과 주소 검색
SELECT STADIUM_NAME "경기장 이름", ADDRESS "주소", SEAT_COUNT "좌석 수" FROM STADIUM WHERE SEAT_COUNT BETWEEN 30000 AND 50000;

--연결 연습
--선수 테이블에서 이름과 별명을 검색
--결과 값을 하나의 컬럼으로 출력 (예를 들면 정다설(두개의 심장))
SELECT PLAYER_NAME || '(' || NICKNAME || ')' "이름(별명)" FROM PLAYER;

--LIKE 연습
--선수 테이블에서 성이 "이"씨인 사람 검색
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE '이%';
--T_STUDENT에서 여학생만 검색
SELECT * FROM T_STAUDENT WHERE JUMIN LIKE '______2______';
--T_EMP 테이블에서 이름에 NE가 들어가는 직원검색
SELECT * FROM T_EMP WHERE ENAME LIKE '%NE%';
--T_EMP 테이블에서 이름의 두번쨰 글자가 A인 직원 검색
SELECT * FROM T_EMP WHERE ENAME LIKE '_A%';

--CASE문 연습
--선수테이블에서 선수들의 성 출력
SELECT
   PLAYER_NAME "선수 이름",
   CASE
      WHEN PLAYER_NAME LIKE '정%' THEN '정씨'
      WHEN PLAYER_NAME LIKE '이%' THEN '이씨'
      ELSE '그 외'
    END "가문"
FROM PLAYER;
--EMP 테이블에서 급여가 3000이상이면 HIGH 1000이상이면 MID 그 외는 LOW
SELECT
   SAL 급여,
   CASE
      WHEN SAL >= 3000 THEN 'HIGH'
      WHEN SAL >= 1000 THEN 'MID'
      ELSE 'LOW'
    END "급여등급"
FROM EMP;
--STADIUM 테이블에소 좌석수가 50001이상이면 L 30001이상 50000이하이면 M 10001이상 300000이하이면 S
SELECT
   SEAT_COUNT 좌석수,
   CASE
      WHEN SEAT_COUNT >= 50001 THEN 'L'
      WHEN SEAT_COUNT BETWEEN 30001 AND 50000 THEN 'M'
      WHEN SEAT_COUNT BETWEEN 10001 AND 300000 THEN 'S'
    END "등급"
FROM STADIUM;

--시퀀스 연습
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
INSERT INTO TEST(NUM,"DATA") VALUES (TEST_SEQ.NEXTVAL,'방가');











