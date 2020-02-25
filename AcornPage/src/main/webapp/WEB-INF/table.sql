//toonDetail 테이블
create table toondetail(title varchar2(100),writer varchar2(100),info varchar2(100),regdate date);

//toonDetail 테이블 더미로우
insert into toonDetail values('원피스','김준서','동료를 모아 모험을 떠나는 만화');
insert into toonDetail values('블리치','백종혁','사신대행');
insert into toonDetail values('나루토','김대희','졸렬잎마을 정치이야기');

//ToonList 테이블
create table toonlist(num number,title varchar2(100),writer varchar2(100),content clob,regdate date,
code varchar2(50) primary key ,hashtag varchar2(100),toonovel varchar2(100));
//TOonList 시퀀스
create sequence toonlist_seq;

//toon 테이블 더미로우
insert into toonList values(1,'원피스','김준서','asfdadsfqwf',sysdate,'one1','코믹','toon');
insert into toonList values(2,'원피스','김준서','asfdadsfqwf',sysdate,'one2','코믹','toon');
insert into toonList values(3,'원피스','김준서','asfdadsfqwf',sysdate,'one3','코믹','toon');

insert into toonList values(1,'블리치','백종혁','asfdadsfqwf',sysdate,'ble1','코믹','toon');
insert into toonList values(2,'블리치','백종혁','asfdadsfqwf',sysdate,'ble2','코믹','toon');
insert into toonList values(3,'블리치','백종혁','asfdadsfqwf',sysdate,'ble3','코믹','toon');

insert into toonList values(1,'나루토','백종혁','asfdadsfqwf',sysdate,'nar1','코믹','toon');
insert into toonList values(2,'나루토','백종혁','asfdadsfqwf',sysdate,'nar2','코믹','toon');
insert into toonList values(3,'나루토','백종혁','asfdadsfqwf',sysdate,'nar3','코믹','toon');

//users 테이블
create table users 
(num number,
id varchar2(100) primary key,
pwd varchar2(100) not null,
email varchar2(100),
wallet number check(wallet>=0),
isWriter varchar2(20), //작가면 true
profile varchar2(100), //프로필 이미지
regdate date
);
//users 시퀀스
create sequence users_seq;

//users더미테이블
insert into users values(1,'kapman','1234','kapman@naver.com',0,'false','0',sysdate);




