use frontenddb;
-- 테이블 확인
show tables;

-- 연산자
-- 산술연산자
-- +, -, *, /, div(왼쪽연산을 오른쪽 연산으로 나눈 후 소수부분을 버림), MOD(나머지 연산)
-- 대입연산자
-- =
-- 비교연산자
-- =, <>(다름), <, >, <=, >=
select mem_userid, mem_userpw, mem_name from tb_member where mem_idx >= 3;

-- is(왼쪽 연산과 오른쪽 연산이 같으면 참), is not(왼쪽 연산과 오른쪽 연산이 다르면 참)
-- null 체크
select * from tb_member where mem_hobby is null;
select * from tb_member where mem_hobby is not null;

-- 논리 연산자
-- and or xor not

-- and/or 여러개, 범위
-- between A and B (값이 A보다 크거나 같고, B보다 작거나 같으면 참을 반환)
select * from tb_member where mem_point >= 0 and mem_point <= 1500;
select * from tb_member where mem_point between 0 and 1500;
-- in() : 연산자의 값이 인수로 전달받은 리스트에 존재하면 참을 반환
select * from tb_member where mem_idx = 1 or mem_idx = 7 or mem_idx = 8;
select * from tb_member where mem_idx in (1,7,8);

-- limit
-- select 컬럼명1, 컬럼명2, .. from 테이블명 limit 가져올 레코드 개수
select mem_userid, mem_userpw, mem_name from tb_member limit 3;
-- select 컬럼명1, 컬럼명2, .. from 테이블명 limit 시작 인덱스, 가져올 레코드 개수
select mem_userid, mem_userpw, mem_name from tb_member limit 0,3 ;

-- 데이터 정렬
-- 오름차순 : asc(생략 가능)
select * from tb_member order by mem_point asc;
-- 내림차순 : desc
select * from tb_member order by mem_point desc;
-- 2차 정렬 : 같은 값이 있을때 정렬하는 방법
select mem_idx, mem_userid, mem_name, mem_point from tb_member order by mem_point asc, mem_idx desc;

-- 그룹
-- select "그룹을 맺은 필드", "그룹함수" from 테이블명 group by 필드명;
-- 집계함수 : count() sum() max() min() avg()
-- as 별명 : php코드에서 필드명을 사용해야하므로 별명을 지어준다
select mem_gender, count(mem_idx) as cnt from tb_member group by mem_gender;
select mem_gender, max(mem_point) as max from tb_member group by mem_gender;
select mem_gender, min(mem_point) as min from tb_member group by mem_gender;
select mem_gender, avg(mem_point) as avg from tb_member group by mem_gender;
select mem_gender, sum(mem_point) as sum from tb_member group by mem_gender;

-- 조인
-- 한 페이지에 보여줘야할 데이터가 서로 다른 테이블에 존재할때
-- select 컬럼명, .. from 테이블명1 (inner, left, right) join 테이블명2 on 테이블명1.필드명=테이블명2.필드명;
-- inner join
select mem_idx, mem_userid, mem_name, pro_height, pro_weight
from tb_member
	inner join tb_profile on tb_member.mem_idx = tb_profile.pro_memidx;
-- left join
-- tb_member의 모든 데이터가 나오게 -> 왼쪽 테이블 중심으로 출력
-- 예를 들어 회원 중에서 주문내역이 있는지 확인할때 회원테이블 중심으로 출력
select mem_idx, mem_userid, mem_name, pro_height, pro_weight
from tb_member
	left join tb_profile on tb_member.mem_idx = tb_profile.pro_memidx;
-- right join
-- tb_profile의 모든 데이터가 나오게 -> 오른쪽 테이블 중심으로 출력
-- 예를 들어 비회원 구매내역을 출력할때 주문 테이블 중심으로 출력하면 얻을 수 있다
select mem_idx, mem_userid, mem_name, pro_height, pro_weight
from tb_member
	 right join tb_profile on tb_member.mem_idx = tb_profile.pro_memidx;