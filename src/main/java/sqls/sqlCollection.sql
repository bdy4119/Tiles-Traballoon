
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

--하나 DB start--------------------------------------------------------------------------------------

create table hotels
(
    seq        int auto_increment primary key,
    hotel_name varchar(50)   not null,
    brief	   varchar(100)	 not null,
    readcount  decimal(8)    not null default 0,
    thumbnail  varchar(1000) not null,
    wdate	   timestamp    not null default now(),
    content	   varchar(1000) not null,
    hotelmap		   varchar(100)	not null,
    book	   varchar(100)	not null	
);
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '노보텔 앰배서더 서울 용산', './hotelimage/1.jpg', 
'노보텔 스위트 앰배서더 서울 용산에 머무르며 서울의 모든 명소를 빠짐없이 방문해 보세요. 
도심에 위치한 본 호텔에 숙박하면 서울 여행이 쉬워집니다. 
경복궁에서 단 5.4km 거리의 편리한 위치에 있는 노보텔 스위트 앰배서더 서울 용산에서 휴가를 더 다양하게 즐기세요.
노보텔 스위트 앰배서더 서울 용산에서 머무시는 동안 편안함을 느끼실 수 있도록 최상의 서비스와 편의 시설이 제공됩니다. 
공항을 오가는 교통편이 필요하신 경우 호텔에서 체크인 날짜 전에 준비를 도와드립니다. 
자동차를 이용하시는 투숙객을 위해 본 호텔에는 주차장이 구비되어 있습니다.

낮에도 밤에도 느긋함을 오롯이 즐기고 싶으시다면 매일 청소 서비스, 24시간 룸서비스 및 룸서비스 같은 
객실 내 편의 서비스를 이용해 객실에서의 시간을 만끽해 보세요.
노보텔 스위트 앰배서더 서울 용산 외부로 나가지 않고도 편의점에서 작은 여행 용품과 잡화를 구입할 수 있습니다. ' , 
'37.53179407282438, 126.96317936574785','https://sdc-club.com/ko/index.php', 
'대한민국 최고의 체험을 
선사하는 숙박시설' );

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '쉐라톤 그랜드 인천', './hotelimage/2.jpg',
'쉐라톤 그랜드 인천 호텔은 인천의 주목할 만한 숙소로 여행객을 위한 현명한 선택입니다. 
본 호텔은 여행하기에 편리한 도시 명소 인근에 있습니다.
쉐라톤 그랜드 인천 호텔에서 편안한 힐링 타임을 즐겨보세요. 
호텔의 무료 Wi-Fi 인터넷을 이용해 원하실 때마다 사진을 게시하고 이메일에 답장해 보세요.
호텔의 공항 이동 교통편 서비스를 이용해 공항을 오가는 교통편을 쉽게 준비할 수 있습니다. 
호텔에서 제공하는 렌터카, 셔틀 및 택시 서비스를 통해 인천 주변 당일 여행, 관광 등을 쉽고 간편하게 계획하세요.
투숙객의 경우 주차는 무료입니다. 
챙겨오지 않은 사소한 것들을 걱정하실 필요가 없습니다. 편의점에 들러 필요한 것을 구매하세요. 

쉐라톤 그랜드 인천 호텔의 모든 객실은 편안함을 염두에 두고 고안되었습니다.
호텔 전체가 완전 금연 구역이며 깨끗한 환경입니다. 흡연은 호텔에서 제공한 지정된 흡연 구역에서만 가능합니다.' , 
'37.39051405463347, 126.64531745341252 ','https://www.marriott.co.kr/hotels/travel/selgi-sheraton-grand-incheon-hotel/' 
,'현대적인 감각과 
전통적인 멋이 공존하는 고급 호텔');
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '코트야드 메리어트 수원', './hotelimage/3.jpg',
'수원 최초의 코트야드 바이 메리어트 호텔입니다. 
광교중앙역에서 6분, 강남역에서 30분 거리에 있는 호텔로 수원컨벤션센터와 갤러리아백화점에 연결되어 있습니다. 
스위트를 포함한 288개 객실을 갖추고 있으며 비즈니스 회의와 특별 이벤트에 적합한 다기능 공간도 제공합니다. 
올데이다이닝 레스토랑 수원 키친은 전용 다이닝룸 4개를 갖추고 있어 회식이나 가벼운 가족 행사에 적합합니다. 
광교호수공원이 내려다보이는 야외 테라스를 갖춘 이그제큐티브 라운지에서는 무료 조식과 해피아워, 하루 종일 다과를 제공해 드립니다. 
럭셔리한 라운지 바 더 레이크 태번에서 편안히 휴식을 취해 보세요. 

시설을 완비한 피트니스 센터에서 운동으로 활력과 에너지를 충전하실 수도 있습니다. 
비즈니스나 휴가 등 여행 목적에 상관없이 코트야드 수원에서 잊지 못할 투숙을 경험해보세요' , 
'37.28457969462797, 127.0575221715392 ','https://www.marriott.co.kr/hotels/travel/selcw-courtyard-suwon/' 
,'도심 속에서도 최상의 휴식을 
제공하는 유럽풍 럭셔리 호텔');
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '세인트존스 강릉', './hotelimage/4.jpg',
'다양한 엔터테인먼트와 휴양을 한 곳에서 즐길 수 있는 곳, 세인트존스 호텔

푸른 해송숲과 청정 동해 바다가 만나는 곳에 위치한 세인트존스 호텔은 호텔 내 여유로운 휴양은 물론
다양한 부대시설과 서비스를 경험할 수 있는 복합 문화 공간입니다.

부지 면적은 약 1만여 평(30,825㎡), 총 1,091객실로 강원도 내 가장 큰 규모를 자랑하며
다양한 연령층의 고객들이 찾는 강릉의 호캉스 명소로 사랑 받고 있고 있습니다.

다양한 컨셉의 다이닝
세인트존스 호텔은 멀리 갈 필요 없이 취향에 따라 다양하게 즐길 수 있는 식음업장을 보유하고 있습니다.

- 호텔 베이커리 전문 셰프가 갓 구운 빵과 함께 강릉의 유명 디저트를 한 곳에 모은 베이커리 "앙빵"
- 원하는 크랩을 골라 다양한 해산물과 함께 특제소스에 볶아 제공되는 레스토랑 "오!크랩"
- 울창한 소나무숲과 아름다움 해변이 이어지는 감성 라운지 카페 & 다이닝 "더그라운드"
- 동해바다와 대관령이 만나는 곳, 모두의 추억을 요리하는 공간 "경양식1982" ' , 
'37.79131997686286, 128.92097870543614','https://new.stjohns.co.kr/',
'취사선택 가능한 아늑한 룸에서 
편안한 휴식을 취할 수 있는 호텔' );
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '스카이베이호텔 경포', './hotelimage/5.jpg',
'강릉의 도심에서 단 몇 분 거리의 스카이베이 호텔 경포에 머물며 진정한 휴가의 의미가 무엇인지 알아보세요. 
경포대에서 단 1.3km 거리에 위치한 스카이베이 호텔 경포에 머물며 
대부분의 여행객이 경험해보지 못한 강릉의 진짜 매력을 탐험해 보세요.

스카이베이 호텔 경포에서 제공하는 다양한 서비스와 편의 시설을 이용해 한층 편하게 머물러 보세요. 
호텔 내에서 제공되는 무료 인터넷으로 편리함과 만족감을 느껴보세요. 
차를 운전해서 오실 경우 호텔 내 무료 주차장을 이용하시기 바랍니다. 
여행 가방 보관, 컨시어지 서비스 및 안전 금고 등 프런트 데스크 서비스를 이용해 편하게 머물러 보세요.
옷을 깨끗하게 해 주는 스카이베이 호텔 경포의 드라이클리닝 서비스 및 세탁 서비스 이용으로 
호텔 숙박 시 짐을 최소화할 수 있습니다. 

매일 청소 서비스 및 룸서비스 같은 객실 내 편의 서비스를 이용하시면 머무시는 시간이 최적의 선택이 될 것입니다. 
외부에 나가지 않고도 사소하거나 당장 필요한 것들을 편의점에서 해결할 수 있습니다. 
스카이베이 호텔 경포의 객실에는 여행객이 필요로 하는 모든 편의 용품/시설이 갖추어져 있습니다. ' , 
'37.80429040800223, 128.90777555665903','http://www.skybay.co.kr'
,'산과 바다의 아름다운 
풍경을 감상할 수 있는 곳' );
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '썬라이즈호텔 속초', './hotelimage/6.jpg',
'썬라이즈 호텔 속초에서 누릴 수 있는 모든 것을 만끽해 보세요.
 머무시는 동안 이용 가능한 무료 Wi-Fi를 통해 쉽게 연락을 지속하세요. 
썬라이즈 호텔 속초에서 제공하는 택시 서비스를 통해 속초 주변 당일 여행, 관광 등을 쉽고 간편하게 계획하세요. 
차를 운전해서 오시는 투숙객의 경우 호텔에서 무료 주차를 이용하실 수 있습니다.

본 호텔에서 머무르며 여행 가방 보관 및 컨시어지 서비스 등 프런트 데스크 직원의 다양한 서비스와 함께 편한 시간을 만끽하세요. 
썬라이즈 호텔 속초의 빨래방 이용으로 원하는 여행용 의상을 계속해서 입어보세요. 
낮에도 밤에도 느긋함을 오롯이 즐기고 싶으신 경우 매일 청소 서비스 같은 
객실 내 편의 서비스를 이용해 객실에서의 시간을 만끽해 보세요. 
뭔가 빠뜨리고 오셨나요? 잊고 있다 생각난 것들을 편의점에서 구매하세요. 
시간 절약과 함께 번거로움을 줄일 수 있습니다.' , 
'38.201796835742385, 128.58889773594242','http://www.sunrisehotel.co.kr/'
,'현대적이고 세련된 분위기가 
돋보이는 럭셔리 호텔' );
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '소노벨 천안	', './hotelimage/7.jpg',
'소노벨 천안에서 최적의 서비스와 편의 시설을 이용해 보세요. 
제공되는 무료 인터넷으로 머무시는 동안 편리함을 배가시켜 보세요.
 차를 운전해서 오실 경우 주차는 무료입니다. 
컨시어지 서비스 등의 프런트 데스크 서비스를 통해 원하시는 도움을 받아보세요.
소노벨 천안 외부로 나가지 않고도 편의점에서 작은 여행 용품과 잡화를 구입할 수 있습니다. 
모든 이용객의 안녕과 건강을 위해 호텔 내 어느 곳에서도 흡연하실 수 없습니다.
객실은 안락한 인테리어 및 필수 용품/시설로 최적의 편안함을 제공하도록 고안되었습니다. 
더 나은 숙박을 위해 본 호텔의 일부 객실은 에어컨 및 린넨 서비스 등을 갖추고 있습니다. 

소노벨 천안은 발코니 또는 테라스 및 거실 등을 포함한 다양한 객실 구성을 가지고 있습니다. 
엔터테인먼트를 위해 투숙객은 일부 엄선된 객실에서 TV 및 케이블 TV 등을 이용할 수 있습니다.' , 
'38.201796835742385, 128.58889773594242','https://www.sonohotelsresorts.com/ca' 
,'빈티지한 분위기가 물씬 풍기는 
충청도의 오아시스');

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '토모노야 료칸 대천', './hotelimage/8.jpg',
'토모노야 호텔 앤 료칸 대천의 우수한 서비스와 편의 시설은 잊을 수 없는 추억을 만들어 줄 것입니다. 
호텔의 무료 Wi-Fi로 쉽고 편리하게 커뮤니케이션을 지속하세요. 
호텔 투숙객의 경우 무료 주차를 하실 수 있습니다. 
호텔에서는 여행 가방 보관 등의 프런트 데스크 서비스를 제공합니다.
호텔의 매일 청소 서비스 이용으로 머무시는 시간을 최적의 선택으로 만들어 보세요. 

투숙객은 토모노야 호텔 앤 료칸 대천에 머무는 동안 편안한 숙박이 보장됩니다. 
일부 엄선된 객실에 포함된 에어컨 및 린넨 서비스와 함께 본 호텔에서 더욱 즐거운 시간을 보내세요. 
특별히 고안된 토모노야 호텔 앤 료칸 대천의 객실은 발코니 또는 테라스와(과) 같은 객실 구성을 제공합니다. 
일부 객실에는 투숙객의 엔터테인먼트를 위한 TV이(가) 준비되어 있습니다.' , 
'36.3486602320251, 126.55612075489536','https://www.tomonoya.co.kr/'
, '인테리어와 자연경관이 
잘 어우러지는 럭셔리 호텔');
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '청풍리조트 제천', './hotelimage/9.jpg',
'청풍 리조트의 훌륭한 서비스와 편의 시설을 통해 잊을 수 없는 힐링 타임을 만끽해 보세요. 
머무시는 동안 이용 가능한 무료 Wi-Fi를 통해 쉽게 연락을 지속하세요. 
이용 가능한 셔틀 서비스를 통해 제천 만끽하기를 시도해 보세요. 
차를 운전해서 오실 경우 리조트 내 주차장을 이용하시기 바랍니다.
여행 가방 보관 및 안전 금고 등 프런트 데스크 서비스를 이용해 편하게 머물러 보세요. 
장기 숙박이나 필요시마다 세탁 서비스 이용을 통해 원하는 여행용 의상을 깨끗하게 유지하고 입을 수 있습니다. 
매일 청소 서비스 같은 객실 내 편의 서비스를 이용하시면 편안하고 만족할만한 숙박이 될 것입니다.
청풍 리조트의 모든 객실은 투숙객이 집과 같은 편안함을 느끼실 수 있도록 고안되었습니다. 

본 리조트의 다양한 식사 옵션은 항상 편리하고 맛있는 식사를 보장합니다. 
직접 식사를 준비하는 것을 선호하는 투숙객은 숙소 내 바베큐 시설을 좋아할 것입니다.
청풍 리조트은 투숙객이 즐길 수 있는 훌륭한 레크리에이션 시설을 제공합니다. 
스파를 방문하는 것으로 하루를 마무리하세요.
' , '37.01692930047279, 128.1772157103097','https://www.cheongpungresort.co.kr/web/kor/asp/index/index.asp' 
,'편안한 휴식을 위한 펜트하우스 
룸 타입을 제공하는 호텔');

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '힐튼호텔 경주', './hotelimage/10.jpg',
'힐튼 경주에 머물며 경주의 다양한 관광 명소를 모두 방문해 보세요.
힐튼 경주에서 이용 가능한 것과 함께 멋지고 행복한 시간을 만들어 보세요. 
제공되는 무료 인터넷으로 머무시는 동안 편리함을 배가시켜 보세요. 
원하시는 경주 곳곳에 방문하시는 데 도움을 드리기 위해 호텔에서 렌터카 및 택시 서비스를 제공합니다. 
차를 운전해서 오실 경우 주차는 무료입니다.
여행 가방 보관, 컨시어지 서비스 및 안전 금고 등 프런트 데스크 서비스를 이용해 여행 세부 일정과 교통편을 문제없이 계획하세요. 

호텔 티켓 서비스 및 투어의 도움을 받아 최적의 티켓과 가장 인기 있는 레스토랑을 예약해 보세요. 
옷을 깨끗하게 해 주는 힐튼 경주의 드라이클리닝 서비스 및 세탁 서비스 이용으로 호텔 숙박 시 짐을 최소화할 수 있습니다. 
느긋함을 오롯이 즐기고 싶으신가요? 매일 청소 서비스, 
24시간 룸서비스 및 룸서비스 같은 객실 내 편의 서비스를 통해 객실에서의 시간을 만끽해 보세요.' , 
'35.8400176004314, 129.2857586571236','http://www.skybay.co.kr' 
,'도시와 자연이 공존하는 
아름답고 특별한 숙소');
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '롯데 시티 호텔 울산', './hotelimage/11.jpg',
'롯데시티호텔울산에서 휴가를 보내며 울산의 매력에 푹 빠져보세요.
롯데시티호텔울산에서 제공하는 다양한 서비스와 편의 시설을 이용해 한층 편하게 머물러 보세요. 
호텔 내에서 제공되는 무료 인터넷으로 편리함과 만족감을 느껴보세요. 
차를 운전해서 오실 경우 호텔 내 무료 주차장을 이용하시기 바랍니다.
여행 가방 보관 및 안전 금고 등 프런트 데스크 서비스를 이용해 편하게 머물러 보세요.
옷을 깨끗하게 해 주는 롯데시티호텔울산의 빨래방 이용으로 호텔 숙박 시 짐을 최소화할 수 있습니다. 
매일 청소 서비스 같은 객실 내 편의 서비스를 이용하시면 편안하고 만족할만한 숙박이 될 것입니다. 
외부에 나가지 않고도 사소하거나 당장 필요한 것들을 편의점에서 해결할 수 있습니다. 

본 호텔은(는) 투숙객의 편의를 위해 일부 객실에 암막 커튼, 에어컨 (Air conditioning) 및 린넨 서비스 등을 갖추고 있습니다. 
일부 객실에서는 TV 및 케이블 TV 등을 포함한 객실 내 엔터테인먼트 시설을 이용할 수 있습니다. 
일부 객실은 냉장고, 생수(병), 커피/티 메이커 (Coffee/tea maker) 등이 제공되므로 음료 걱정을 하지 않으셔도 됩니다.' , 
'35.537465715047155, 129.32962985761236','https://www.lottehotel.com/ulsan-city/ko.html' 
,'지친 일상에서 벗어나 힐링을 
추구하는 고객을 위한 호텔');
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '호텔 리베라 거제', './hotelimage/12.jpg',
'호텔 리베라 거제의 우수한 서비스와 편의 시설은 잊을 수 없는 추억을 만들어 줄 것입니다. 
호텔의 무료 Wi-Fi로 쉽고 편리하게 커뮤니케이션을 지속하세요. 호텔 투숙객의 경우 무료 주차를 하실 수 있습니다. 
호텔에서는 여행 가방 보관 등의 프런트 데스크 서비스를 제공합니다.
호텔 리베라 거제의 빨래방 이용으로 원하는 여행용 의상을 계속해서 입어보세요. 
호텔의 룸서비스 이용으로 머무시는 시간을 최적의 선택으로 만들어 보세요. 
호텔 리베라 거제의 모든 객실은 편안함을 염두에 두고 고안되었습니다. 
호텔 리베라 거제의 일부 객실은 투숙객의 편의를 위해 암막 커튼을 갖추고 있습니다. 
호텔 리베라 거제의 일부 객실은 객실 구성에 발코니 또는 테라스 및 거실 등을 포함하고 있습니다. 

편의 용품과 서비스 외에도 모든 투숙객이 숙소에서의 시간을 만끽할 수 있도록 최선의 노력을 다합니다. 
휴가 중에도 일상을 유지하고 싶은 운동 애호가는 본 호텔의 피트니스 시설을 이용할 수 있습니다.' , 
'34.81137114952709, 128.7041913254763','http://www.hotelriviera.co.kr/geoje/' 
,'오션뷰를 자랑하는 객실과
편안한 휴식을 제공하는 호텔');

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '베스트웨스턴 군산', './hotelimage/13.jpg',
'베스트웨스턴 군산 호텔은 여행과 출장 모두를 위한 군산 방문에 탁월한 숙소입니다. 
본 숙소에서 투숙객은 활기찬 도시의 모든 명소까지 쉽게 접근할 수 있습니다.
베스트웨스턴 군산 호텔의 우수한 서비스와 편의 시설은 잊을 수 없는 추억을 만들어 줄 것입니다. 
호텔의 무료 Wi-Fi로 쉽고 편리하게 커뮤니케이션을 지속하세요. 호텔 투숙객의 경우 무료 주차를 하실 수 있습니다. 
호텔의 투어 이용으로 엔터테인먼트와 이곳저곳 방문을 위한 예약과 티켓 예약에 도움을 받을 수 있습니다. 

숙소 내 조식이 제공되는 베스트웨스턴 군산 호텔에서 아무 걱정 없이 하루를 시작해 보세요. 
본 호텔의 카페에서 제공되는 맛있는 커피 한잔으로 밝고 활기차게 하루를 시작하세요. 
외식을 하고 싶지 않을 때 본 호텔에서는 언제든지 맛있는 식사 옵션을 선택할 수 있습니다.
액티비티와 편의 시설이 다양하게 제공되는 베스트웨스턴 군산 호텔에서 단 하루도 공허하게 보내지 마세요. 
휴가 중에도 일상을 유지하고 싶은 운동 애호가는 본 호텔의 피트니스 시설을 이용할 수 있습니다.' , 
'35.94848126395811, 126.58386509280864','http://www.gunsanhotel.co.kr/' 
,'조용하고 한적한 환경의
힐링을 위한 특별한 공간');

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '라마다 프라자 여수', './hotelimage/14.jpg',
'라마다 프라자 바이 윈덤 돌산 여수에서 최적의 서비스와 편의 시설을 이용해 보세요. 
제공되는 무료 인터넷으로 머무시는 동안 편리함을 배가시켜 보세요.
차를 운전해서 오실 경우 주차는 무료입니다. 
여행 가방 보관 및 안전 금고 등 프런트 데스크 서비스를 이용해 여행 세부 일정과 교통편을 문제없이 계획하세요.
뭔가 빠뜨리고 오셨나요? 잊고 있다 생각난 것들을 편의점에서 구매하세요. 
시간 절약과 함께 번거로움을 줄일 수 있습니다. 

라마다 프라자 바이 윈덤 돌산 여수에서는 매일 아침 제공되는 숙소 내 맛있는 조식으로 하루를 시작할 수 있습니다. 
매일 아침 카페에서 모닝 커피를 즐기지 않고서 휴가를 시작하지 마세요. 
본 호텔에 머무는 동안 다양하고 맛있는 식사 옵션 중에서 선택해 보세요. 
본 호텔의 바에서 보내는 밤은 여행 동반자와 함께 하는 밤처럼 즐거울 수 있습니다.' , 
'34.716832969698245, 127.74817040946805','http://www.ramadaplazadolsanyeosu.com'
,'여행지에서 조용함을 
추구하는 고객을 위한 호텔' );
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '샹그리아비치 목포', './hotelimage/15.jpg',
'샹그리아 비치 관광 호텔에서 제공하는 다양한 서비스와 편의 시설을 이용해 한층 편하게 머물러 보세요. 
호텔 내에서 제공되는 무료 인터넷으로 편리함과 만족감을 느껴보세요. 
차를 운전해서 오실 경우 호텔 내 무료 주차장을 이용하시기 바랍니다.
여행 가방 보관, 컨시어지 서비스 및 안전 금고 등 프런트 데스크 서비스를 이용해 편하게 머물러 보세요.
샹그리아 비치 관광 호텔의 일부 객실은 추가 객실 구성인 거실을 포함합니다. 
일부 객실에서는 TV 및 케이블 TV 등을 포함한 객실 내 엔터테인먼트 시설을 이용할 수 있습니다.

샹그리아 비치 관광 호텔에서의 매일은 숙소 내 맛있는 조식으로 시작됩니다. 
숙소 내 커피숍이 있다는 것은 매일 아침 또는 원할 때 언제든지 갓 내린 
신선한 진짜 커피 한 잔을 즐길 수 있음을 의미합니다. 
본 호텔에는 배가 고플 때마다 언제든지 이용 가능한 편리하고 맛있는 다양한 식사 옵션이 기다리고 있습니다. 
본 호텔의 바에서 여행 동반자와 함께 즐거운 밤을 보내세요.' , 
'34.797077773339, 126.43342503757879','http://www.shangriahotel.co.kr/' 
,'아름다운 전망을 감상할 수 있는
바다가 보이는 오션뷰 호텔');
INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '파르나스 호텔 제주', './hotelimage/16.jpg',
'파르나스 호텔 제주의 편의 시설/서비스를 통해 편안하고 안락한 시간을 보낼 수 있습니다. 
호텔의 무료 Wi-Fi 인터넷을 이용해 원하실 때마다 사진을 게시하고 이메일에 답장해 보세요. 
호텔에서 제공하는 택시 서비스를 통해 편리한 제주 여행을 만끽해 보세요. 
투숙객의 경우 주차는 무료입니다.

파르나스 호텔 제주에서는 매일 아침 제공되는 숙소 내 맛있는 조식으로 하루를 시작할 수 있습니다. 
본 호텔에 위치한 카페에서 맛있는 커피 한 모금으로 아침의 행복을 즐겨보세요. 
본 호텔의 다양한 식사 옵션은 항상 편리하고 맛있는 식사를 보장합니다. 
본 호텔의 바에서는 멀리 가지 않고도 여행 동반자와 함께 잊지 못할 밤을 보내실 수 있습니다.

파르나스 호텔 제주의 레크리에이션 시설은 일상 탈출 및 휴식을 염두에 두고 고안되었습니다. 
본 호텔의 바로 가까이에 위치한 해변을 탐방하며 시간을 보내보세요. 
적어도 한두 번은 본 호텔의 수영장을 방문하는 것을 잊지 마세요. 
본 호텔의 풀사이드 바에서 수영복 차림으로 좋아하는 음료를 즐겨보세요.' , 
'33.24458229994502, 126.40579282520552','https://parnashoteljeju.com' 
,'제주의 자연과 조화로운 디자인, 
다양한 편의시설과 개성 넘치는 객실');

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '메종 글래드 제주', './hotelimage/17.jpg',
'메종 글래드 제주의 객실을 예약해 제주 도심 속 휴식을 최대한 즐겨보세요. 
도심 한가운데 있는 메종 글래드 제주에서는 최고의 지역 중심지에서 하루를 시작할 수 있어 
시간을 절약하고 더 많이 여행할 수 있습니다.
메종 글래드 제주의 우수한 서비스와 편의 시설은 잊을 수 없는 추억을 만들어 줄 것입니다. 
켓 서비스 및 투어 이용으로 엔터테인먼트와 이곳저곳 방문을 위한 예약과 티켓 예약에 도움을 받을 수 있습니다. 
호텔 내 드라이클리닝 서비스 및 세탁 서비스 이용으로 원하는 여행용 의상을 깨끗하게 유지 가능하여 짐을 최소화할 수 있습니다.
특별히 디자인된 메종 글래드 제주의 객실은 
발코니 또는 테라스 및 거실 등이 있는 객실을 포함하여 하나 이상의 객실 구성을 제공합니다. 
일부 엄선된 객실에는 투숙객의 엔터테인먼트를 위한 TV, 객실 내 비디오 스트리밍, 
일간 신문 및 케이블 TV 등이 준비되어 있습니다.

숙소 내 조식이 제공되는 메종 글래드 제주에서 아무 걱정 없이 하루를 시작해 보세요. 
본 호텔의 카페에서 제공되는 맛있는 커피 한잔으로 밝고 활기차게 하루를 시작하세요. 
외식을 하고 싶지 않을 때 본 호텔에서는 언제든지 맛있는 식사 옵션을 선택할 수 있습니다. 
숙소 밖을 나가지 않고 카지노 및 바 등에서 즐거운 저녁을 만끽하세요.' , 
'33.484417296047184, 126.48845044710309','https://www.glad-hotels.com/maisongladjeju/index.do' 
,'제주의 느긋한 바다와 섬의 조망을 
한눈에 볼 수 있는 고급 호텔');

INSERT INTO hotels (readcount, hotel_name, thumbnail, content, hotelmap, book, brief)
VALUES (0, '서귀포칼호텔', './hotelimage/18.jpg',
'서귀포 칼 호텔에 머무르며 제주의 모든 명소를 빠짐없이 방문해 보세요. 
도심에 위치한 본 호텔에 숙박하면 제주 여행이 쉬워집니다.
서귀포 칼 호텔에서 머무시는 동안 편안함을 느끼실 수 있도록 최상의 서비스와 편의 시설이 제공됩니다. 
머무시는 동안 이용 가능한 무료 Wi-Fi를 통해 쉽게 연락을 지속하세요. 
차를 운전해서 오시는 투숙객의 경우 호텔에서 무료 주차를 이용하실 수 있습니다.
여행 가방 보관 등의 프런트 데스크 서비스를 이용해 편하게 머물러 보세요.
필요하신 경우 투어 이용으로 가까운 곳에서 공연되는 멋진 쇼와 프로그램 티켓을 구하고 예약해 보세요. 

숙소 내 조식으로 매일 아침을 시작하세요. 배고픔이 여행 계획에 영향을 미치게 해서는 안됩니다! 
숙소 내 레스토랑은 편리하고 맛있는 식사 옵션을 제공합니다.
본 호텔은(는) 머무는 동안 이용할 수 있는 다양한 레크리에이션 시설을 갖추고 있습니다. 
본 호텔에 위치한 사우나을(를) 방문하여 완전한 휴식으로 하루를 마무리하세요. 
본 호텔의 수영장에서 편안한 시간을 보내보세요.' , 
'33.247355143407155, 126.58203183836129','http://seogwipo.kalhotel.co.kr'
,'제주의 조용한 바닷가에서 
휴식과 멋진 뷰를 즐기는 호텔' );




drop table hotel_comments;
select * from hotel_comments;

create table hotel_comments
(
    seq        int auto_increment primary key,
    id         varchar(50),
    hotelseq   int,
    content    varchar(1000) not null,
    wdate timestamp     not null default now(),
    foreign key (hotelseq) references hotels (seq),
    foreign key (id) references member (id)
);


--하나 DB end----------------------------------------------------------------------------------------


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