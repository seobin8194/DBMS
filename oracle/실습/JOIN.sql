--원하는 데이터가 여러 테이블에 흩어져 있다
--이렇게 가져오면 데이터가 곱해져서 나온다
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P, TEAM T;

--각 테이블에서 정보를 얻으면 느리다
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

--EMP 테이블에서 사원번호로 DEPT 테이블의 지역 검색하기
--사원번호는 EMP에 있고 지역은 부서 테이블에 존재하므로 이 두케이블을 조인 -> 서로 공유 데이터인 DEPTNO으로 조인
SELECT
   E.EMPNO 사원번호,
   D.LOC 지역이름
FROM EMP E INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO; 

--PLAYER 테이블에서 송종국 선수가 속한 팀의 전화번호 검색
--선수 정보는 PLAYER 테이블에 있고 팀 전화번호는 TEAM 테이블에 있으므로 이 두 테이블을 조인 -> 두 테이블의 공유 데이터인 TEAM_ID로 조인
--이때 송종국 테이블 선수의 정보만 가져와야한다
--조인 후 송종국만 걸러내도 되고 송종국만 조인해도 된다
SELECT
   P.PLAYER_NAME 선수이름,
   T.TEL 전화번호
FROM PLAYER P INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID
WHERE P.PLAYER_NAME = '송종국';
--on절에서 조건을 걸 수 있다 -> 애초에 송종국만 join -> 더 효율적이나 가독성을 위해서는 where절
SELECT 
   T.TEAM_NAME 팀이름, 
   P.PLAYER_NAME 선수이름, 
   T.DDD || ')' || T.TEL 팀번호 
FROM TEAM T INNER JOIN PLAYER P ON P.TEAM_ID = T.TEAM_ID AND P.PLAYER_NAME = '송종국';

--JOBS 테이블에서 JOB_ID로 EMPLOYEES의 풀네임, 직업명 검색
--EMPLOYEES에서 사원 이름을 가져오고 이들이 가지는 직업명은 JOBS 테이블에서 가져옴 -> 두 테이블의 공유 데이터인 JOB_ID로 조인
SELECT 
   J.JOB_TITLE 직업명,
   E.FIRST_NAME || E.LAST_NAME 플네임
FROM JOBS J INNER JOIN EMPLOYEES E ON J.JOB_ID = E.JOB_ID; 

--T_STUDENT 테이블과 T_DEPARTMANT 테이블에서 학생이름, 1전공의 학과번호, 1전공 학과이름 검색
--학생이름은 T_STUDENT에 있고 이 학생의 전공 정보는 T_DEPARTMENT 테이블에 있다 -> 두 테이블의 공유 데이터인 DEPTNO로 조인
SELECT
   S.NAME 학생이름,
   D.DEPTNO 학과번호,
   D.DNAME 학과이름
FROM T_STUDENT S INNER JOIN T_DEPARTMENT D ON S.DEPTNO1 = D.DEPTNO;

--T_STUDENT 테이블, T_PROFESSOR 테이블과 JOIN
--학생이름, 지도교수 번호, 지도교수 이름 검색 (문제점 확인)
--문제점 : STUDENT 테이블에서 외래키가 널인 경우 그 행을 제외하고 조인한다
--        -> 외부조인으로 교수를 가리키는 외래키가 없어도 조인해서 데이터가 나오게 한다
SELECT
   S.NAME 학생이름,
   P.PROFNO 교수번호,
   P.NAME 교수이름
FROM T_STUDENT S INNER JOIN T_PROFESSOR P ON S.PROFNO = P.PROFNO;

--비등가 조인
--3개 테이블 조인
--테이블들을 조인해서 붙여 놓은 테이블에서 각 행의 데이터가지고 조인조건을 만족하면 된다
--예를들면 EMP와 SALGRADE를 조인한 테이블에서 SAL=800인 행의 LASAL(700)과 HISAL(1200)을 가지고 조인 조건에 대입하면 만족한다
--이렇게 조인한 테이블에 같은 방식으로 DEPT를 조인한다
SELECT * FROM EMP;
SELECT * FROM SALGRADE;
SELECT 
   E.EMPNO 사원번호, 
   E.ENAME 사원이름, 
   E.SAL 급여, 
   S.GRADE 등급, 
   D.DNAME 부서명
FROM EMP E 
   INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
   INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

--EMPLOYEES 테이블에서 HIREDATE가 1993~1995년인 사원 검색
--이름 부서명 입사날짜 (입사날짜 오름차순으로 정렬)
--이름 입사날짜는 EMPLAYEES 테이블에 있고 부서명은 DEPARTMENT 테이블에 있다 -> 공유 데이터인 DEPARTMENT_ID로 조인
SELECT 
   E.FIRST_NAME || E.LAST_NAME 사원이름,
   D.DEPARTMENT_NAME 부서명,
   E.HIRE_DATE 입사날짜
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.HIRE_DATE BETWEEN TO_DATE('1993-01-01','yyyy-MM-DD') AND TO_DATE('1995-12-31','yyyy-MM-DD')
ORDER BY E.HIRE_DATE ASC;
--TO_CHAR(시간데이터,'YYYY')
--ORDER BY에 정수를 쓰면 그 순번에 있는 컬럼으로 정렬한다
SELECT 
   E.FIRST_NAME || E.LAST_NAME 사원이름,
   D.DEPARTMENT_NAME 부서명,
   TO_CHAR(E.HIRE_DATE, 'YYYY/MM/DD') 입사날짜
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE TO_CHAR(E.HIRE_DATE,'YYYY') BETWEEN '1993' AND '1995'
ORDER BY 3; 

--OUTER JOIN
--LEFT는 STUDENT테이블 모두와 조인 RIGHT는 교수 테이블 모두와 조인
SELECT
   S.NAME 학생이름,
   NVL(P.PROFNO,000) 교수번호,
   NVL(P.NAME,'배정없음') 지도교수명
FROM T_STUDENT S
   LEFT OUTER JOIN T_PROFESSOR P ON S.PROFNO = P.PROFNO;
   
--STADIUM 테이블에서 경기장 이름 좌석수 홈팀명 검색
--홈팀이 없는 경우 홈팀없음으로 출력
--STADIUM에 홈팀이 없으므로 홈팀없는 스타디움 행이 짤린다 따라서 스타디움의 모든 행을 조인해야하기 때문에 LEFT
SELECT * FROM STADIUM;
SELECT * FROM TEAM;
SELECT
   S.STADIUM_NAME "경기장 이름",
   S.SEAT_COUNT 좌석수,
   NVL(T.TEAM_NAME,'홈팀없음') 홈팀이름
FROM STADIUM S LEFT OUTER JOIN TEAM T ON S.HOMETEAM_ID = T.TEAM_ID;

--NATURAL JOIN
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;
--기존 방식과 달리 조인 조건없이 조인이 가능하다
--SELECT * 했을때 두 테이블의 중복 컬럼이 생기면 맨 앞으로 출력하며 하나만 출력
SELECT * FROM EMP E NATURAL JOIN DEPT D;
--USING절 사용하눈 경우 중복 컬럼의 이름과 타입이 모두 같아야한다
SELECT * FROM EMP JOIN DEPT USING(DEPTNO);

--CROSS JOIN 
SELECT * FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;


--셀프 조인
SELECT 
   E1.ENAME 사원명,
   E2.ENAME 매니저명
FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO;

--T_DEPT2 테이블에서 부서와 그 상위 부서 출력
SELECT * FROM T_DEPT2;
SELECT 
   D1.DCODE 부서번호,
   D1.DNAME 부서명,
   NVL(D2.DNAME,'최상위부서') 상위부서명
FROM T_DEPT2 D1 LEFT OUTER JOIN T_DEPT2 D2 ON D1.PDEPT = D2.DCODE;

--T_PROFESSOR 테이블에서 교수번호 교수이름 입사일 입사일 자기보다 빠른 사람의 인원수
--1. 기준 :P1 재료 : P2
--2. SELECT문 작성
--조인전 데이터는 기준 테이블에서 가져오고 COUNT는 재료 테이블에서 가져온다
--3. COUNT는 값 하나만 가져온다 -> GROUP
--COUNT를 그룹으로 묶고 나니 기존 데이터는 여러개 나온다 -> 기존 데이터도 그룹으로 묶어 줘야한다
--4. P2.HIREDATE->*로 가져올때랑 비교 OUTER조인 -> NULL인거 제외하는거 방지하려고 
SELECT
   P1.PROFNO 교수번호,
   P1.NAME 교수이름,
   P1.HIREDATE 입사일,
   COUNT(P2.HIREDATE) "빨리 입사한 사람"
FROM T_PROFESSOR1 P1 LEFT OUTER JOIN T_PROFESSOR P2 ON P1.HIREDATE > P2.HIREDATE
GROUP BY P1.PROFNO, P1.NAME, P1.HIREDATE;


조인 수행 원리
1. NESTED LOOP JOIN
가장 기본적인 조인
먼저 읽은 테이블의 행 수만큼 JOIN을 수행
선행 테이블(DRIVING TABLE)이 JOIN의 성능을 결정한다
후행 테이블(DRIVEN TABLE)은 나중에 읽은 테이블을 의미한다
2. SORT-MERGE JOIN
검색과 비교 검색 전에 WHERE조건을 기준으로 정렬한다
정렬할떄 시간이 매우 오래 걸리지만 인덱스가 존재하지 않을때 빨리 해당 데이터를 찾아서 결과를 출력할 수 있다
3.HASH-JOIN
인덱스가 있기때문에 SORT-MERGER JOIN보다 2배 이상 빠른 속도로 검색이 가능하다


