-- 실행
-- CTRL + ENTER(문장 끝, 블록, 문장중간)

-- 데이터베이스 확인
-- show databases
SHOW DATABASES;

-- 데이터 베이스 생성
-- create database 데이터베이스명;
create database frontenddb;

-- 데이터베이스 삭제
-- drop database 데이터베이스명;
drop database frontenddb;

-- 데이터베이스 선택
-- use 데이터베이스명
use frontenddb;

-- 회원 테이블 만들기
create table tb_member(
    mem_idx bigint auto_increment primary key,
    mem_userid varchar(20) unique not null,
    mem_userpw varchar(20) not null,
    mem_name varchar(20) not null,
    mem_hp varchar(13) not null,
    mem_email varchar(50),
    mem_hobby varchar(100),
    mem_ssn1 char(6) not null,
    mem_ssn2 char(7) not null,
    mem_zipcode char(5) not null,
    mem_address1 varchar(100),
    mem_address2 varchar(100),
    mem_address3 varchar(100),
    mem_regdate datetime default now()
);

-- 테이블구조 확인
-- DESC 테이블명
DESC tb_member;

-- 테이블삭제
-- drop table 테이블명
drop table tb_member;

-- 테이블 필드 추가
-- alter table 테이블명 add 컬럼명 컬럼타입 제약조건;
alter table tb_member add mem_point int default 0;

-- 테이블 필드 수정
-- alter table 테이블명 modify column 컬럼명 컬럼타입 제약조건;
alter table tb_member modify column mem_address3 varchar(50);

-- 테이블 필드 삭제
-- alter table 테이블명 drop 컬럼명
alter table tb_member drop mem_point;

-- 데이터삽입
-- 테이블에 삽입되는 순서대로 저장되지 않는다 따라서 테이블의 목록을 가져올때 index나 날짜순으로 정렬할 필요가 있다
-- 1. insert into 테이블명 values(값1, 값2, 값3, ..);
-- 2. insert into 테이블명(필드명1, 필드명2, ..) values (값1, 값2, ..);
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('apple','1111','김사과','010-1111-1111','apple@apple.com','드라이브','001011','4068518','12345','서울 강남구','역삼동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('banana','2222','바나나','010-2222-2222','banana@apple.com','여행','001011','4068518','12345','서울 서초구','양재동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('orange','3333','오렌지','010-3333-3333','orange@orange.com','영화','001011','4068518','12345','경기도 고양시','덕양구','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('melon','4444','이메론','010-4444-4444','melon@melon.com','음악감상','001011','4068518','12345','경기도 고양시','원흥동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('berry','5555','이베리','010-5555-5555','berry@berry.com','헬스','001011','4068518','12345','경기도 고양시','삼송동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('tomato','6666','토마토','010-6666-6666','tomato@tomato.com','책읽기','001011','4068518','12345','서울 서초구','방배동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('cherry','7777','이체리','010-7777-7777','cherry@cherrycom','게임','001011','4068518','12345','서울 동작구','신데방동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('coconet','8888','고코넛','010-8888-8888','coconet@coconet.com','등산','001011','4068518','12345','서울 동작구','흑석동','11-1');
insert into tb_member(mem_userid, mem_userpw, mem_name, mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('grapes','9999','구래프','010-9999-9999','grapes@grapes.com','쇼핑','001011','4068518','12345','서울 구로구','구로동','11-1');
insert into tb_member (mem_userid, mem_userpw, mem_name, mem_hp, mem_ssn1, mem_ssn2, mem_zipcode, mem_address1, mem_address2, mem_address3) values('avocado', '1010', '안카도', '010-6666-6666', '001011','3018518','1111','서울 서초구','111-11','1111');


-- 데이터 수정
-- 1. update 테이블명 set 필드명1 = 값1, 필드명2 = 값2..;
update tb_member set mem_point = 500;
update tb_member set mem_point = mem_point + 1000;
-- 2. update 테이블명 set 필드명1 = 값1, 필드명2 = 값2.. where 조건절;
update tb_member set mem_point = 300 where mem_userid = 'apple';

-- 데이터 삭제
-- 1. delete from 테이블명
-- 2. delete from 테이블명 where 조건절
delete from tb_member where mem_idx = 10;

-- 데이터 검색
-- 1. select 필드명1, 필드명2, .. from 테이블명;
select mem_userid, mem_name, mem_hp from tb_member;
-- 2. select 필드명1, 필드명2, .. from 테이블명 where 조건절;
select mem_userid, mem_name from tb_member where mem_userid = 'apple';
-- 모든 데이터 확인
-- *는 모든 컬럼(속도저하가 일어나기 때문에 실제 사용하지 않는 것을 권장)
select * from tb_member;
-- 로그인 처리할때 이용하는 쿼리
select * from tb_member where mem_userid = 'orange' and mem_userpw = '3333';

-- 추가 테이블 (tb_member와 관계있는 테이블)
create table tb_profile (
    pro_memidx bigint,
    pro_age int,
    pro_gender enum('남자','여자'),
    pro_height double,
    pro_weight double,
    pro_birthday datetime,
    foreign key(pro_memidx) references tb_member(mem_idx)
);

insert into tb_profile values (1, 20, '여자', 160.5, 50.5, '1998-11-01');
-- 참조하는 테이블의 데이터만 넣어야한다
-- insert into tb_profile values (10, 25, '남자', 170.5, 60, '2000-11-01');
insert into tb_profile(pro_memidx, pro_age) values (6, 22); 
insert into tb_profile(pro_memidx, pro_age, pro_gender, pro_height, pro_weight) values (7, 32, '남자', 180.5, 80.5); 

-- 외래키가 연결되어 있는 경우 삭제
-- 원본 테이블의 데이터를 삭제할때 문제 -> 프로필 테이블에서 외래키로 이 데이터를 사용하고 있으므로 에러
-- 1. 외래키 데이터 삭제
delete from tb_profile where pro_memidx = 6;
-- 2. 원본 데이터 삭제
delete from tb_member where mem_idx = 6;

select * from tb_profile;