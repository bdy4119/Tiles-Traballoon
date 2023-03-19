
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
    readcount  decimal(8)    not null COMMENT '조회수'
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

insert into reviewcomment
values(1,'abc', '야호', now());
-- ----------



-- 데이터 정보 전체 불러오기
-- 글 전체 지워주세요
delete from review
where id='abc';

delete from review
where id='bdy';

-- 아이디 추가하고 아래 데이터 삽입해주세요!
-- abc아이디는 있으면 추가안해도 됩니다
insert into member
values ('abc', '길동이', '123', '홍길동', 'abc@naver.com', '부천', '123-456-781', 3);

insert into member
values ('bdy', '금쪽이', '000', '백다연', 'bdy@naver.com', '서울', '008-456-781', 3);


-- 글 데이터 삽입
insert into review
values (1, 'abc', 0, 0, 0, '제주여행기', '여행 가격
개인(일반)3,000원<br/>
개인(청소년)1,500원<br/>
개인(어린이)1,500원<br/>
단체(일반)2,500원<br/>
단체(청소년)1,000원<br/>
단체(어린이)1,000원<br/>
<br/>천연기념물로 지정 보호되고 있는 비자림은 44만8165㎡ 면적에 수령 500~800년 된 비자나무 2800여 그루가 서식하고 있습니다. 높이 7~14m, 지름 50~110cm, 폭 10~15m에 이르는 대형 나무들이 군집한 세계적으로 드문 비자나무 숲입니다. 예로부터 비자나무의 열매인 비자는 구충제로 널리 쓰였고 나무는 소재가 좋아 고급 가구나 체커를 만드는 데 사용되었습니다. 비자림은 내도 풍란, 풍란, 콩짜란, 흑난초, 비자란과 같은 희귀 난초 식물의 본거지이기도 합니다. 무성한 녹색 육두구 숲에서 삼림욕을 하면 혈관이 유연해지고 심신의 피로가 회복되며 인체의 리듬을 회복하는 자연 건강 휴양 효과가 있습니다. 또한 빼어난 자연경관을 자랑하는 월랑봉, 아부오름, 용눈오름 등 아름다운 기생화산이 있으며, 특히 촬영지로 가벼운 하이킹과 운동을 하기에 안성맞춤인 코스입니다.
</p>', now(), 0, 28);


insert into review
values (2, 'abc', 0, 0, 0, '부산가즈아~', '첫째날 부산 여행
이렇게 부산에 도착해서 남포동으로 향했습니다.
남포동에 도착해서 일단 부산에 오면 이건 꼭 먹고가야한다는 돼지국밥을 먹었습니다.
뭔가 새로운맛을 경험한듯한 맛이었습니다. 그리고 씨앗호떡도 먹고싶었지만 줄이 도저히 줄어들 생각을 안해서 패스했습니다.
그러고 부산 광복동거리를 돌다가 용두산 공원으로 발길을 옮겼습니다.
그리고 이날은 태풍이 강타하는 날로 비는 내리지 않았지만 엄청난 위력의 바람로 절 맞아주었습니다.
정말 살면서 처음으로 바람에 날라갈수 있겠단 생각이 들었기 때문이죠.
이렇게 용두산공원을 둘러보고 다음 향한 곳은 해운대인데요.
해운대에선 강한 모래바람이 맞아줘서 제대로 구경못하고 까페에서 시간을 보냈네요.
그리고 다음 향한곳이 부산 센텀시티입니다. 세계 최대 백화점이라는 명성에 맞게 엄청 크네요.
백화점안에 들어서서 향한곳이 나이키인데요. 판매업계에서 꽤나 알려져있다길래 한번 찾아가봤습니다. 
이걸 보는 순간 너무 분위기있게 연출된 모습 역시 나이키다 싶었습니다.
그러고 매장안을 둘러보는데 사복입고 돌아다니는 저에게 손님 한분이 "이것좀 보여주세요 하길래", 평소에는 당연히 "여깄습니다" 하고 보여줘야하는 저이기에 사복을 입었음에도 내가 판매하는 사원의 포스가 느껴졌나 봅니다. 이렇게 백화점안을 둘러보고 광안리로 향했습니다. 광안대교이 야경을 담기위해서죠. 광안리해수욕장은 많은 사람들로 북적였는데요. 저처럼 카메라를 들고 사진을 담는 분들도 많이 보여서 왠지 모르게 친근감이 드네요. 이렇게 야경사진을 찍고 회한접시를 헤치우고 하루를 마쳤네요. 이 많은 과정이 하루만에 벌어진 일입니다. 내가 많이 돌아다니긴 했구나 싶네요. 그렇게 여행 하루가 지나고 둘째날이 왔습니다.

둘째날 부산 여행
둘째날은 광안리에서 시작했습니다. 날씨가 좋아서 하늘도 무심하진 않는구나 생각이 들었습니다. 그래서 더욱 좋아진 마음으로 출발했습니다. 부산에는 유독 높은 빌딩들이 자리하고 있네요. 그렇게 광안리에서 동백섬으로 향했습니다. 동백섬을 시작으로 해운대까지 가는 코스로 향했습니다. 쭉 놓여진 코스를 가다가 나무들 사이로 저멀리 광안대교가 펼쳐져있네요. 밤에보는 광안대교와 사뭇 다른 느낌이네요. 그렇게 얼마지나지 않아 부산APEC정상회담이 열련던 누리마루가 눈에 띄네요. 누리마루를 지나 어느덧 해운대에 도착했는데요. 어제랑 사뭇다른 날씨로 인해 어제는 사람의 흔적을 찾아볼수 없었던 해운대가 오늘은 많은 사람들로 북적대네요. 모레사장 뒤편으로 보도블럭으로 많은 분들이 런닝을 하는데 다음에 기회가 되면 뛰어보고 싶네요. 이제 어느덧 여행의 막바지가 되어가는데요. 마지막으로 향한곳이 부산 태종대입니다. 버스타고 멀리멀리 가서야 도착했는데요. 지금까지 많은 곳을 다녔지만 태종대가 제일 인상이 깊네요. 찍혀진 사진들만 봐도 태종대에서 반이상을 찍었네요. 쭉 길을 따라 가다가 우연히 이거다 싶어 찍은 사진이에요. 여기는 코스가 길어서 다누비열차가 중간중간 위치한 곳까지 안내해주는 열차가 있었는데 타고싶었지만 저는 사진을 위해서 걷기로 감행했습니다. 그렇게 한참을 걷다가 전망대까지 이르게 되었습니다. 전망대에서 잠시 숨을 고르면서 전망대 아래로 봤는데 아찔하더라구요. 전망대에서 다시 또 걷기 시작했습니다. 그렇게 또 도착한곳이 영동등대 여긴 정말 부산여행중 최고였던것 같습니다. 전망과 탁트여진 바다 말로 표현이 안되었습니다. 더 많은곳을 가보고 싶었지만 시간관계상 여기까지 다녀왔는데요. 기회되면 다시 찾아오고싶은 생각이 간절하네요. 이렇게 여행을 마무리하고 다시 부산역으로 향했습니다. 부산역에 도착하니 어둑어둑해진게 이제 저도 집에 가야될때가 온것 같습니다. 마지막 사진을 찍고 힘든 몸을 이끌고 KTX에 몸을 실었습니다. 힘들기도 힘들었지만 참 재미난 여행이었던것 같네요. 집에만 있었다면 정말 최악의 휴가가 될뻔 했는데 부산여행으로 인해 최고의 휴가가 되었네요. 이렇게 부산여행은 마무리 되었습니다.',
'2023-02-19 13:14:00', 0, 15);




insert into review
values (3, 'bdy', 0, 0, 0, '강원도 철원 다녀옴!', '지금 가면 함께 볼만한 철원 명소
순담매표소에서 멀지 않은 곳에 고석정 꽃밭이 있다. 고석정 꽃밭은 지금이 가장 아름다울 때다.
축구장 33개 크기의 옛 포 사격장 부지가 온통 꽃으로 뒤덮인다. 노오란 물결의 유채꽃밭을 비롯해 수레국화밭, 호밀밭, 양귀비, 라벤더, 장미가 형형색색 만발한다. 5월 18일에 개장한 꽃잔치는 6월 말까지 계속된다. ',
'2023-03-17 03:14:03', 0, 8);




insert into review
values (4, 'bdy', 0, 0, 0, '여수밤바다 갬성ㅠㅡㅠ',
'<p>자산공원과 돌산공원 모두 전망대, 편의점 등 편의시설이 구비되었으며 돌산공원의 편의시설 규모가 상대적으로 작은 편이다. 다만, 돌산공원 탑승장에서 내려가는 길에 위치한 돌산대교 뷰포인트가 무척 아름답다. 돌산대교 옆으로 지는 환상적인 일몰, 놓치지 말자.
(야경보다가 생각나서 버스커버스커 첨부해봄)
<iframe width="560" height="315" src="https://www.youtube.com/embed/K2MFPTekyMM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
<p>',
'2023-03-15 03:14:03', 0, 46);








insert into review
values (5, 'abc', 0, 0, 0, '강릉 항호해변(방탄 봄날 뮤비 촬영지)',
'<p>향호해변은 주문진해변의 북쪽편. 청시행 비치에서 향호저수지의 물이 바다로 흘러드는 곳까지를 말합니다. 이전에는 강릉 가볼만한 곳으로 청시행해변이 각광받았으나 현재는, 포토존으로 꾸며진 야자수나 벤치 등이 많이 철거되어 바로 근처에 있는 향호해변이 인기를 끌고 있습니다. 주문진의 낭만 비치라고 불리울 정도로 하얀 백사장에 드넓은 푸르른 바다가 예쁜 해변입니다. 사진 찍기 좋은 포토존도 많이 있으니 친구, 가족, 연인과 함께 방문해보시는 것도 좋을 것 같습니다.
bts-봄날
<iframe width="560" height="315" src="https://www.youtube.com/embed/xEeFrLSkMm8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
<p>',
'2023-01-19 03:14:03', 0, 11);





insert into review
values (6, 'bdy', 0, 0, 0, '경주 동궁과 월지의 야경',
'남천(문천) 위를 수놓고 있는 월정교는
신라시대 월성과 남쪽 지역을 잇는 통로였고,
원효대사와 요석공주의 사랑이야기가 얽힌
사랑의 길이기도 하다.

낮에는 월정교의 자태를 오롯이 볼 수 있어서
좋고, 밤에는 다리를 비추는 은은한 조명과
그 아래를 흐르는 냇물에 비친 월정교의 모습이
마치 천국의 다리 같은 모습을 연출하므로
이왕이면 밤에 가보실 것을 추천드린다.',
'2023-03-01 12:14:03', 0, 31);




insert into review
values (7, 'abc', 0, 0, 0, '충주 탄금대vv',
'탄금대는 1400여년전 우리나라 3대 악성 중 하나인 신라시대 우륵선생이 가야금을 탄주 했던 곳이며, 후세에 사람들이 가야금을 연주한 곳이라 하여 탄금대라 부르고 있습니다.
진흥왕이 가야를 합병하고 우륵을 이곳 탄금대에 살게 했으며, 우륵은 이곳에서 제자를 양성하며 가야금을 켜며 180여곡의 가야금곡을 남겼습니다.
그리고 400여년전에는 조선시대 신립장군이 배수진을 치고 왜구를 맞아 장렬히 싸우다 순국하신 전적지이기도 합니다.
왜적은 쳐들어오자 물러설 곳도, 피할 곳도 없는 탄금대에서 군사 8000여 명이 죽어가는 가운데에도 신립은 끝까지 활을 높지 않다가 끝내 강물로 뛰어들어 자결했습니다.
탄금대는 무엇보다 남한강이 절벽을 따라 휘감고 돌아 울창한 송림과 어우러져 경관이 빼어난 곳입니다.
탄금대에는 충혼탑과  팔천고혼위령탑이 있으며, 곳곳에 조각상과 시비가 세워져 있습니다.',
now(), 0, 19);






insert into review
values (8, 'bdy', 0, 0, 0, '포항 상생의손',
'포항 여행길에 호미곶을 빼놓을 수 없다. 청하공진시장에서 구룡포 가는 길에 들러볼 만하다. 호미곶은 1월이면 새해 다짐을 하려는 이들이 몰린다. 전국 해돋이 명소의 상징이 된 조형물 ‘상생의손’이 나오게 다양한 각도에서 사진을 찍는 재미가 쏠쏠하다.

〈당일 여행 코스〉
청하공진시장→구룡포(구룡포근대문화역사거리-포항구룡포과메기문화관)

〈1박 2일 여행 코스〉
첫째 날 / 청하공진시장→호미곶
둘째 날 / 석병1리→구룡포(구룡포근대문화역사거리-포항구룡포과메기문화관)',
'2023-02-11 21:20:03', 0, 4);





insert into review
values (9, 'abc', 0, 0, 0, '대구 수목원',
'※ 대구 수목원
-위치 : 대구광역시 달서구 화암로 342 대구수목원관리사무소
-운영시간 : (1월~4월) 09:00~18:00, (5월~8월) 08:00~19:00, (9월~12월) 09:00~18:00
-이용요금 : 무료
-문의 : 053-803-7270
-주차 : 자체 주차장 이용


대구 수목원은 전국 최초로 쓰레기 매립장을 수목원으로 조성한 곳인데요. 
수목원 조성 이전에는 대구 시민들의 생활 쓰레기를 매립하여 10여 년 동안 방치되어 있었다고 합니다. 
지금은 이전 모습이 상상이 되지 않을 만큼 빼어난 자연 풍경을 가지고 있는데요. 
총 21개 테마로 여러 식물들이 심어져 있으며, 지역 주민들의 여가와 휴식공간으로도 많이 이용된다고 합니다. 
현재도 지속적으로 확장 사업을 진행한다고 하니 앞으로가 더욱 기대가 되는 곳이기도 합니다. 
공원에 여러 포토존들이 있으니 산책을 하며 멋진 풍경과 함께 사진을 찍는 재미를 찾아보세요.',
now(), 0, 3);





insert into review
values (10, 'abc', 0, 0, 0, '대부도 여행',
'대부도에는 낭만적인 해안길이 있다. 바다와 산, 숲과 들판을 아우르는 대부해솔길이 그 주인공. 총 11개의 코스로, 짧게는 5km, 길게는 17km에 이른다. 하루 시간을 내서 대부도로 서울근교 당일치기 여행을 다녀왔다. 11개의 코스를 다 다녀오지는 못했지만, 짧게나마 그 아름다움을 맛보고 왔다.​
대부도의 해안선을 따라 섬 한 바퀴를 둘러볼 수 있어 서울 근교 드라이브 코스로 추천하는 이곳. 대부도의 자연과 명소를 제대로 체험하고 싶다면, 대부해솔길을 걸어봐도 좋겠다. 빼어난 자연 풍광에 빠져 걷다 보면 시간 가는 줄 모를 것이니.',
'2023-03-13 03:14:03', 0, 26);



insert into review
values (11, 'abc', 0, 0, 0, '남이섬 메타세콰이어길',
'이곳이 그 유명한 남이섬의 메타세콰이어길!!! 끝이 보이지않게 나무들이 줄지어져 있어요.

원래는 요 메타세콰이어길에 서서 사진찍는 관광객이 그렇게 많다던데, 코로나이기도 하고 너무 늦게 입장하기도 해서 그런지 휑했어요. 저는 사람 많아서 북적북적 거리는걸 별로 안좋아하는데 사람이 없어서 너무 좋았구, 사람이 없으니 메타세콰이어길에 서서 사진을 엄청 많이 찍고 왔습니다!!

나무 왼쪽에 살짝 보이는 하얀색 풍선에는 나중에 밤이되었을 때 불이 들어오는데 정말예뻐요!',
now(), 0, 36);

                    


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


-- 동민 DB-------------------------------------------------------------------------------------------
drop table member;

create table member
(
    id    varchar(20) primary key not null,
    nickname varchar(20) not null,
    pwd   varchar(50) not null,
    name  varchar(20) not null,
    email varchar(50) unique,
    address varchar(40) not null,
    phonenumber varchar(20) not null,
    auth  int
);
delete from member
where address = '남원시';

select * from member;
use travel;
create table trip
(
    seq       int auto_increment primary key,
    city      varchar(50)   not null,
    spot      varchar(50)    not null,
    title     varchar(200)  not null,
    content   text not null,
    wdate     timestamp     not null,
    readcount decimal(8)    not null
);
alter table community
add foreign key(id) references mypage(id);

alter table review
add foreign key(id) references mypage(id);

-- db에서 데이터 뿌리기리한 쿼리
insert into mypage
values (1, 'abc', '제목', '내용', now(), 0, 0);
select *
from mypage;
create table mypage
(
	seq int auto_increment primary key,
    id varchar (20),
    nickname varchar(50),
	title varchar (200),
	content varchar (4000),
	wdate timestamp not null,
	del decimal (1),
	readcount decimal (8)
);
insert into member(id, nickname, pwd, name, email, address, phonenumber, auth)
values ('ssd', 'Rld', '123', 'jon', 'jon@gmail.com', '서울시', '01022', 3);

select *
from community, member
where (member.id = community.id);

create table mypagecommunityAf
(
    seq       int auto_increment primary key,
    id        varchar(50)   not null,
    nickname varchar(50)	not null,
    ref       decimal(8)    not null,
    step      decimal(8)    not null,
    depth     decimal(8)    not null,

    title     varchar(200)  not null,
    content   varchar(4000) not null,
    wdate     timestamp     not null,

    del       decimal(1)    not null,
    readcount decimal(8)    not null
);
insert into mypagecommunity
VALUES (2, 'abc','길떵이', 1, 0, 0, 1, 'abc', 'abc', CURRENT_TIMESTAMP, 0, 0);
-- 동민 DB-------------------------------------------------------------------------------------------