
--쿼리문 작성 해주시고 수정 사항 생기면 업데이트 부탁드립니다

--03.18 trip table 생성

--travel database 생성
create database travel;

--travel database 사용
use travel;

--동민 DB-------------------------------------------------------------------------------------------

create table member
(
    id    varchar(50) primary key,
    nickname varchar(20) not null,
    pwd   varchar(50) not null,
    name  varchar(20) not null,
    email varchar(50) unique,
    adress varchar(40) not null,
    phonenumber varchar(20) not null,
    auth  int
);

insert into member
values('admin','admin','123','admin','admin@naver.com','admin','123','3');
insert into member
values('abc','abc','123','abc','abc@naver.com','abc','123','3');

--동민 DB-------------------------------------------------------------------------------------------
--영권 DB-------------------------------------------------------------------------------------------
drop table community;

create table community
(
    seq       int auto_increment primary key,
    id        varchar(50)   not null,
    ref       decimal(8)    not null,
    step      decimal(8)    not null,
    depth     decimal(8)    not null,

    title     varchar(200)  not null,
    content   text not null,
    wdate     timestamp     not null,

    del       decimal(1)    not null,
    readcount decimal(8)    not null
);

insert into community
VALUES (1, 'abc', 1, 0, 0, 1, 'abc', 'abc', CURRENT_TIMESTAMP, 0, 0);

drop table trip;

create table trip
(
    seq       int auto_increment primary key,
    id        varchar(50),
    city      varchar(50)   not null,
    spot      varchar(50)    not null,
    title     varchar(200)  not null,
    image     text not null,
    content   text not null,
    wdate     timestamp     not null,
    readcount decimal(8)    not null
);

insert into trip
VALUES (1, 'admin', 'seoul', '광화문', '광화문제목','광화문이미지', '광화문내용', CURRENT_TIMESTAMP, 1);

drop table communitycomment;

create table communitycomment
(
    seq     decimal(5)    not null,
    id      varchar(50),
    content varchar(1000) not null,
    wdate   timestamp     not null
);

insert into communitycomment
VALUES (1, 'abc', 'abc', CURRENT_TIMESTAMP);

--영권 DB-------------------------------------------------------------------------------------------


--다연 DB-------------------------------------------------------------------------------------------
-- review부분에 들어갈 전체 정보 table
create table review
(
    seq        int auto_increment primary key COMMENT '시퀀스 넘버',
    id         varchar(50)   not null COMMENT '아이디',

    ref        decimal(8)    not null COMMENT '답변 글이 참조하는 원래번호',
    step       decimal(8)    not null COMMENT '답변 글 출력순서',
    depth      decimal(8)    not null COMMENT '답변 글 깊이',

    title      varchar(200)  not null COMMENT '글제목',
    content    varchar(4000) not null COMMENT '내용',
    wdate      timestamp     not null COMMENT '작성일',

    del        decimal(1)    not null COMMENT '수정으로로 삭제할시 0으로 수정',
    readcount  decimal(8)    not null COMMENT '조회수',

    updatedate DATETIME null COMMENT '수정일자',
    deletedate DATETIME null COMMENT '삭제일자'
);

alter table review
add foreign key(id) references member(id);



-- 댓글 table
create table reviewcomment(
	seq decimal(5) not null,
	id varchar(50),
	content varchar(1000) not null,
	wdate timestamp not null
);

alter table reviewcomment
add foreign key(id) references member(id);
-- ----------


-- 데이터 삽입용
insert into review
values (1, 'bdy', 0, 0, 0, '제주여행기', '제주여행 테스트', now(), 0, 0, null, null);


-- 데이터 정보 전체 불러오기
select seq,
       id,
       ref,
       step,
       depth,
       title,
       content,
       wdate,
       del,
       readcount,
       updatedate,
       deletedate
from (select row_number() over(order by ref desc, step asc) as rnum, seq
           , id
           , ref
           , step
           , depth
           , title
           , content
           , wdate
           , del
           , readcount
           , updatedate
           , deletedate
      from review

      order by ref desc, step asc) a
where rnum between 21 and 30;


-- 글쓰기 쿼리문
insert into review(id, ref, step, depth, title, content, wdate, del, readcount)
values ('id', (select ifnull(max(ref, 0) + 1 from bbs b),
                      0,
                      0,
                      'title',
                      'content',
                      now(),
                      0,
                      0));
                      
                    


--다연 DB-------------------------------------------------------------------------------------------

                      
                      
--재훈 DB-------------------------------------------------------------------------------------------

--지도 불러올거 생각해서 위도, 경도, 주소 넣어두긴 했는데 카카오지도같은거에서 주소 불러오는 방법이 따로 있는거같아서
--지금건 임의로만 사용하겠습니다. member랑 연결시킬건 많지 않을 것 같아서 진행하면서 수시로 업데이트 하겠습니다!                      

--추가로 쿼리문 짜둔거 기존거랑 통일시키느라 제거 대문자를 소문자로 다 바꿨는데 검색해서 변경해서 깃허브에 바뀐게 많다고 뜨는데
--데이터 이름은 바뀐거 없고 into같은거는 확인해서 변경해 두었습니다                       

create table region
(
    seq   			int primary key not null,
    regionname   	varchar(50) not null COMMENT '지역명'
);
                      
create table place
( 
    seq   		int             not null, 
    placename   varchar(20)      not null COMMENT '여행지명', 
    latitude    double          null, 
    address     varchar(200)    null, 
    longitude   double          null 
);                      
                      
create table experience
( 
    seq     	int             not null, 
    exname    	varchar(45)     not null COMMENT '체험명', 
    latitude   	double          null, 
    longitude  	double          null, 
    address    	varchar(200)    null
);



create table restaurant
(
    seq    	   int             not null, 
    resname    varchar(45)     not null COMMENT '식당명', 
    latitude   double          null, 
    longitude  double          null, 
    latitude   varchar(200)    null
);


create table spot
(
    seq        int             not null, 
    spotname   varchar(45)     not null COMMENT '관광명소명', 
    latitude   double          null, 
    longitude  double          null, 
    address    varchar(200)    null
);                      
                      
insert into region (seq, regionname)
values (1, '서울')
 
--재훈 DB-------------------------------------------------------------------------------------------

--하나 DB-------------------------------------------------------------------------------------------

create table hotels
(
    seq        int auto_increment primary key,
    hotel_name varchar(50)   not null,
    read_count decimal(8)    not null default 0,
    thumbnail  varchar(1000) not null,
    created_at timestamp     not null default now(),
    updated_at timestamp
);

INSERT INTO hotels (read_count, hotel_name, thumbnail)
VALUES (10, 'hotelA', 'https://example.com/hotelA.jpg');

INSERT INTO hotels (read_count, hotel_name, thumbnail)
VALUES (10, 'hotelB', 'https://example.com/hotelB.jpg');



SELECT *
FROM hotel_comments;

create table hotel_comments
(
    id         varchar(50),
    seq        int auto_increment primary key,
    hotelseq   int,
    content    varchar(1000) not null,
    created_at timestamp     not null default now(),
    updated_at timestamp,
    foreign key (hotelseq) references hotels (seq)
);

INSERT INTO hotel_comments (hotelseq, content)
VALUES (1, '호텔A 첫 후기');

INSERT INTO hotel_comments (hotelseq, content)
VALUES (2, '호텔B 첫 후기');

--하나 DB-------------------------------------------------------------------------------------------
