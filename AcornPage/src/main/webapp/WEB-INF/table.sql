//tooninfo 테이블
create table tooninfo (title varchar2(50),writer varchar2(30),info varchar2(100));

//toon 테이블 더미로우
insert into tooninfo values('원피스','김준서','동료를 모아 모험을 떠나는 만화');
insert into tooninfo values('블리치','백종혁','사신대행',);
insert into tooninfo values('나루토','김대희','졸렬잎마을 정치이야기');

//toon 테이블
create table toon(num number,title varchar2(30),writer varchar2(30),content varchar2(100),upload date,
	code varchar2(20),hashtag varchar2(30),toon_novel varchar2(10));

//toon 테이블 더미로우
insert into toon values(1,'원피스','김준서','asfdadsfqwf',sysdate,'one1','코믹','toon');
insert into toon values(2,'원피스','김준서','asfdadsfqwf',sysdate,'one2','코믹','toon');
insert into toon values(3,'원피스','김준서','asfdadsfqwf',sysdate,'one3','코믹','toon');

insert into toon values(1,'블리치','백종혁','asfdadsfqwf',sysdate,'ble1','코믹','toon');
insert into toon values(2,'블리치','백종혁','asfdadsfqwf',sysdate,'ble2','코믹','toon');
insert into toon values(3,'블리치','백종혁','asfdadsfqwf',sysdate,'ble3','코믹','toon');

insert into toon values(1,'나루토','백종혁','asfdadsfqwf',sysdate,'nar1','코믹','toon');
insert into toon values(2,'나루토','백종혁','asfdadsfqwf',sysdate,'nar2','코믹','toon');
insert into toon values(3,'나루토','백종혁','asfdadsfqwf',sysdate,'nar3','코믹','toon');

//유저테이블
create table users 
(num number,
id varchar2(100) primary key,
pwd varchar2(100) not null,
newPwd varchar2(100),
wallet number check(wallet>=0),
isWriter varchar2(20),
profile varchar2(100),
regdate date
);

//유저더미테이블
insert into users values(1,'kapman','1234','123',0,'0','0',sysdate);




