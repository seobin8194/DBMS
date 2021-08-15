--그룹함수는 일반적인 컬럼과 함께 검색할 수 없다 -> 테이블이 찌그러진다
--T_EMP 테이블에서 매니저, 총 직원수, 급여 총액, 급여 평균, 교통비 평균 출력
SELECT
   MGR 매니저,
   COUNT(*) 직원수,
   SUM(SAL) 급여총액,
   AVG(SAL) 급여평균,
   AVG(COMM) 교통비평균
FROM T_EMP;
--T_EMP 테이블에서 매니저 별로 총 직원수 급여 총액 급여 평균 교통비 평균
--평균 구할때 NULL이 포함되어 있으면 그냥 NULL이 출력되므로 NULL처리를 해야한다
SELECT
   MGR 매니저,
   COUNT(*) 직원수,
   SUM(SAL) 급여총액,
   AVG(NVL(SAL, 0)) 급여평균,
   AVG(NVL(COMM,0)) 교통비평균
FROM T_EMP GROUP BY MGR ORDER BY MGR ASC;

--별로 -> 그룹
--포지션 별로 페이 평균을 구한다
SELECT
   "POSITION" 포지션,
   AVG(NVL(PAY,0)) 페이평균
FROM T_PROFESSOR GROUP BY "POSITION";
--PLAYER 테이블에서 평균키 평균 몸무게를 포지션별로 검색
SELECT
   POSITION 포지션,
   ROUND(AVG(NVL(HEIGHT,0)),1) || 'CM' 평균키,
   ROUND(AVG(NVL(WEIGHT,0)),1) || 'KG' 평균몸무게
FROM PLAYER 
WHERE "POSITION" IS NOT NULL 
GROUP BY "POSITION" ORDER BY 포지션 ASC;

--그룹으로 묶고 또 그룹내에서 그룹을 묶는다
--T_PROFESSOR에서 학과별 직급별 교수들의 평균 급여 계산
--예 101 정교수 얼마
SELECT 
   DEPTNO 학과, 
   "POSITION" 직급, 
   AVG(PAY) 평균급여 
FROM T_PROFESSOR 
GROUP BY DEPTNO, "POSITION" 
ORDER BY DEPTNO ASC,"POSITION" DESC;

--HAVING절
--WHERE절은 그룹핑하기 전에 조건을 줄때 그리고 전체를 대상으로 하는 데이터를 가지고 조건을 걸때 이용
--HAVING절은 그룹핑으로 출력한 데이터를 가지고 조건을 걸때 이용
--학과별 평균낸것중 350이상 인거 검색
SELECT DEPTNO 학과, AVG(PAY) FROM T_PROFESSOR GROUP BY DEPTNO HAVING AVG(PAY) >= 350;

--HAVONG절에서 전체를 대상으로 하는 데이터를 가지고 조건도 걸 수 있다
--그룹으로 묶고 NULL이면 제외
SELECT "POSITION" FROM PLAYER GROUP BY "POSITION" HAVING "POSITION" IS NOT NULL;
--NULL이면 제외하고 그룹으로 묶기
--더 효율적이다
SELECT "POSITION" FROM PLAYER WHERE "POSITION" IS NOT NULL GROUP BY "POSITION";

--EMPLOYEES 테이블에서 JOB_ID 별로(GROUP) 평균 SALERY(HAVING)가 10000미만인 SALERY 합계, 평균, 최대, 최소 값, 사람 수 검색 (job_id 오름차순 검색)
SELECT
   JOB_ID ID, 
   AVG(SALARY) 평균급여, 
   SUM(SALARY) 합계, 
   MAX(SALARY) 최대, 
   MIN(SALARY) 최소, 
   COUNT(JOB_ID) 사람수 
FROM EMPLOYEES 
GROUP BY JOB_ID HAVING AVG(SALARY) < 10000
ORDER BY JOB_ID ASC;
--PLAYER 테이블에서 몸무게(WHERE)가 80이상인 선수들의 평균키(HAVING)가 180이상인 포지션 검색
SELECT "POSITION" 포지션
FROM PLAYER 
WHERE WEIGHT >= 80 
GROUP BY "POSITION" HAVING AVG(HEIGHT) >= 180;
--T_PROFESSOR 테이블에서 직위가 정교수나 조교수인 사람 중에(WHERE) 과별로(GROUP) 
--과번호, 소속 교수 총 수, 근속일 수 평균, 급여 평균, 보너스 평균 검색(과번호 오름차순)
SELECT 
   DEPTNO 과번호, 
   COUNT(PROFNO) "교수 수", 
   ROUND(AVG(SYSDATE-HIREDATE),1) "근속일 수 평균", 
   AVG(PAY) "급여 평균", 
   AVG(NVL(BONUS,0)) "보너스 평균"
FROM T_PROFESSOR 
WHERE "POSITION" IN ('정교수','조교수')
GROUP BY DEPTNO
ORDER BY DEPTNO;
--T_STUDENT 테이블에서 학과별로(GROUP) 학과번호 최대 몸무게와 최소 몸무게의 차이 검색
SELECT 
   DEPTNO1 학과번호, 
   MAX(WEIGHT) - MIN(WEIGHT) "몸무게 차이"
FROM T_STUDENT
GROUP BY DEPTNO1
ORDER BY DEPTNO1 ASC;




