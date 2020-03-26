drop table library;
drop table toondetail;
drop table toonlist;
drop table star;
drop table toon_comment;
drop table commentlike;
drop table users;



drop sequence toonlist_seq;
drop sequence users_seq; 
drop sequence star_seq;
drop sequence library_seq;
drop sequence toon_comment_seq;
drop sequence commentlike_seq;


create sequence toonlist_seq;
create sequence users_seq;
create sequence star_seq;
create sequence library_seq;
create sequence toon_comment_seq;
create sequence commentlike_seq;


create table toondetail
(title varchar2(100) not null primary key,
writer varchar2(100) not null,
info varchar2(100) not null,
regdate date,
hashtag varchar2(100) ,
toonovel varchar2(100) not null,
thumb varchar2(100),
permit varchar2(100) 
);

insert into toondetail values('원피스','김준서','동료를 모아 모험을 떠나는 만화',sysdate,'코믹','toon',null,'Y');
insert into toondetail values('블리치','백종혁','사신대행',sysdate,'액션','toon',null,'Y');
insert into toondetail values('나루토','김대희','졸렬잎마을 정치이야기',sysdate,'액션','toon',null,'N');
insert into toondetail values('클레이모어','윤지혜','졔작가의 클레이모어 이야기',sysdate,'액션 판타지','toon',null,'Y');


create table toonlist
(num number not null, 
title varchar2(100) not null, 
writer varchar2(100) not null, 
content clob not null, 
regdate date , 
code varchar2(50) not null primary key,
permit varchar2(100)
);


insert into toonlist values(1,'원피스','김준서','원피스1화content',sysdate,'원피스1','Y');
insert into toonlist values(2,'원피스','김준서','원피스2화content',sysdate,'원피스2','Y');
insert into toonlist values(3,'원피스','김준서','원피스3화content',sysdate,'원피스3','Y');

insert into toonlist values(1,'블리치','백종혁','블리치1화content',sysdate,'블리치1','Y');
insert into toonlist values(2,'블리치','백종혁','블리치2화content',sysdate,'블리치2','Y');
insert into toonlist values(3,'블리치','백종혁','블리치3화content',sysdate,'블리치3','Y');

insert into toonlist values(1,'나루토','김대희','나루토1화content',sysdate,'나루토1','N');
insert into toonlist values(2,'나루토','김대희','나루토2화content',sysdate,'나루토2','N');
insert into toonlist values(3,'나루토','김대희','나루토3화content',sysdate,'나루토3','N');

insert into toonList values(1,'클레이모어','윤지혜','클레이모어1화content',sysdate,'클레이모어1','Y');
insert into toonList values(2,'클레이모어','윤지혜','클레이모어2화content',sysdate,'클레이모어2','Y');
insert into toonList values(3,'클레이모어','윤지혜','클레이모어3화content',sysdate,'클레이모어3','Y');

create table users 
(num number,
id varchar2(100) primary key not null,
pwd varchar2(100) not null,
email varchar2(100) not null,
wallet number check(wallet>=0),
isWriter varchar2(20),
profile varchar2(100),
regdate date,
lastread varchar2(50)
);

insert into users values(1,'kapman','1234','kapman@naver.com',3000,'N',null,sysdate,null);
insert into users values(2,'gura','1234','gura@naver.com',3000,'N',null,sysdate,null);
insert into users values(3,'monkey','1234','mon@naver.com',3000,'N',null,sysdate,null);

create table star
(num number,
id varchar2(100) not null,
code varchar2(50) not null,  
starvalue number
);

insert into star values(1,'kapman','원피스1',10);
insert into star values(2,'gura','원피스1',3);
insert into star values(3,'monkey','원피스1',8);
insert into star values(4,'gura','원피스2',7);
insert into star values(5,'monkey','원피스2',3);
insert into star values(6,'monkey','원피스3',5);

create table library
(num number,
id varchar2(100),
code varchar2(50) references toonlist(code) ON DELETE CASCADE,
regdate date
);

insert into library values (1,'kapman','블리치1',sysdate);
insert into library values (2,'kapman','블리치2',sysdate);
insert into library values (3,'kapman','블리치3',sysdate);
insert into library values (4,'kapman','나루토1',sysdate);

create table toon_comment
(num number, 
id varchar2(100),
code varchar2(50), 
content varchar2(100) not null, 
likeCount number,
commcode varchar2(50) not null primary key,
regdate date
);

insert into toon_comment values(1,'kapman','원피스1','더럽게재밋네1',0,'원피스1com1',sysdate);
insert into toon_comment values(2,'kapman','원피스1','더럽게재밋네2',0,'원피스1com2',sysdate);
insert into toon_comment values(3,'kapman','원피스1','더럽게재밋네3',0,'원피스1com3',sysdate);
insert into toon_comment values(4,'kapman','원피스2','더럽게재밋네4',0,'원피스2com1',sysdate);
insert into toon_comment values(5,'kapman','원피스2','더럽게재밋네5',0,'원피스2com2',sysdate);

create table commentlike
(num number, 
id varchar2(100), 
commcode varchar2(50),
regdate date,
code varchar2(50)
);

insert into commentlike values (1,'kapman','원피스1com1',sysdate,'원피스1');
insert into commentlike values (2,'kapman','원피스1com2',sysdate,'원피스1');
insert into commentlike values (3,'kapman','원피스1com3',sysdate,'원피스1');
insert into commentlike values (4,'kapman','원피스2com1',sysdate,'원피스2');
insert into commentlike values (5,'kapman','원피스2com2',sysdate,'원피스2');
insert into commentlike values (6,'gura','원피스1com1',sysdate,'원피스1');
insert into commentlike values (7,'gura','원피스1com2',sysdate,'원피스1');
insert into commentlike values (8,'gura','원피스1com3',sysdate,'원피스1');
insert into commentlike values (9,'gura','원피스2com1',sysdate,'원피스2');
insert into commentlike values (10,'gura','원피스2com2',sysdate,'원피스2');


