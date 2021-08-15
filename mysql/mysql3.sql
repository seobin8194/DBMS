-- 게시판에 이용할 테이블
create table tb_board(
    b_idx bigint auto_increment primary key,
    -- 한사람이 여러개 쓸 수 있기 때문에 unique는 안건다 
    b_userid varchar(20) not null,
    b_title varchar(200) not null,
    b_content text,
    b_hit int default 0,
    b_regdate datetime default now(),
    b_file varchar(100),
    b_up int default 0
);

create table tb_reply(
    re_idx bigint auto_increment primary key,
    re_userid varchar(20) not null,
    re_content varchar(1000) not null,
    re_regdate datetime default now(),
    re_boardidx bigint not null,
    FOREIGN KEY (re_boardidx) REFERENCES tb_board(b_idx)
);

-- 11 10 9
select * from tb_board order by b_idx desc limit 3;
-- 인덱스 3부터 3개
select * from tb_board limit 3, 3;
