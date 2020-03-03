create sequence toonlist_seq;
create sequence users_seq;
create sequence star_seq;
create sequence library_seq;
create sequence comment_seq;
create sequence commentlike_seq;


create table toondetail
(title varchar2(100),
writer varchar2(100),
info varchar2(100),
regdate date,
hashtag varchar2(100) ,
toonovel varchar2(100)
);

insert into toondetail values('원피스','김준서','동료를 모아 모험을 떠나는 만화',sysdate,'코믹','toon');
insert into toondetail values('블리치','백종혁','사신대행',sysdate,'액션','toon');
insert into toondetail values('나루토','김대희','졸렬잎마을 정치이야기',sysdate,'액션','toon');


create table toonlist
(num number , 
title varchar2(100) , 
writer varchar2(100) , 
content clob , 
regdate date , 
code varchar2(50) primary key
);


insert into toonlist values(1,'원피스','김준서','원피스1화content',sysdate,'one1');
insert into toonlist values(2,'원피스','김준서','원피스2화content',sysdate,'one2');
insert into toonlist values(3,'원피스','김준서','원피스3화content',sysdate,'one3');

insert into toonlist values(1,'블리치','백종혁','블리치1화content',sysdate,'ble1');
insert into toonlist values(2,'블리치','백종혁','블리치2화content',sysdate,'ble2');
insert into toonlist values(3,'블리치','백종혁','블리치3화content',sysdate,'ble3');

insert into toonlist values(1,'나루토','백종혁','나루토1화content',sysdate,'nar1');
insert into toonlist values(2,'나루토','백종혁','나루토2화content',sysdate,'nar2');
insert into toonlist values(3,'나루토','백종혁','나루토3화content',sysdate,'nar3');

insert into toonList values(1,'클레이모어','윤지혜','asfdadsfqwf',sysdate,'클레이모어1','코믹','toon');
insert into toonList values(2,'클레이모어','윤지혜','asfdadsfqwf',sysdate,'클레이모어2','코믹','toon');
insert into toonList values(3,'클레이모어','윤지혜','asfdadsfqwf',sysdate,'클레이모어3','코믹','toon');

create table users 
(num number,
id varchar2(100) primary key,
pwd varchar2(100) not null,
email varchar2(100),
wallet number check(wallet>=0),
isWriter varchar2(20),
profile varchar2(100),
regdate date
);

insert into users values(1,'kapman','1234','kapman@naver.com',0,'false','0',sysdate);

create table star
(num number primary key,
id varchar2(100),
code varchar2(50), 
starvalue number
);

insert into star values(1,'kapman','one1',10);
insert into star values(2,'gura','one1',3);
insert into star values(3,'monkey','one1',8);
insert into star values(4,'gura','one2',7);
insert into star values(5,'monkey','one2',3);
insert into star values(6,'monkey','one3',5);

create table library
(num number,
id varchar2(100),
code varchar2(50),
regdate date
);

insert into library values (1,'kapman','ble1',sysdate);
insert into library values (2,'kapman','ble2',sysdate);
insert into library values (3,'kapman','ble3',sysdate);
insert into library values (4,'kapman','nar1',sysdate);

create table toon_comment
(num number, 
id varchar2(100),
code varchar2(50), 
content varchar2(100), 
likeCount number,
commcode varchar2(50),
regdate date
);

insert into toon_comment values(1,'kapman','one1','더럽게재밋네1',0,'one1com1',sysdate);
insert into toon_comment values(2,'kapman','one1','더럽게재밋네2',0,'one1com2',sysdate);
insert into toon_comment values(3,'kapman','one1','더럽게재밋네3',0,'one1com3',sysdate);
insert into toon_comment values(4,'kapman','one2','더럽게재밋네4',0,'one2com1',sysdate);
insert into toon_comment values(5,'kapman','one2','더럽게재밋네5',0,'one2com2',sysdate);

create table commentlike
(num number, 
id varchar2(100), 
commcode varchar2(50),
regdate date
);

insert into commentlike values (1,'kapman','one1com1',sysdate);
insert into commentlike values (2,'kapman','one1com2',sysdate);
insert into commentlike values (3,'kapman','one1com3',sysdate);
insert into commentlike values (4,'kapman','one2com1',sysdate);
insert into commentlike values (5,'kapman','one2com2',sysdate);
insert into commentlike values (6,'gura','one1com1',sysdate);
insert into commentlike values (7,'gura','one1com2',sysdate);
insert into commentlike values (8,'gura','one1com3',sysdate);
insert into commentlike values (9,'gura','one2com1',sysdate);
insert into commentlike values (10,'gura','one2com2',sysdate);


