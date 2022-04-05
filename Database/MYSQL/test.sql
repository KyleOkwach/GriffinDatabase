use Griffin;
drop table tbltest;
create table tbltest(
	username varchar(64) primary key,
    pass varchar(64),
    email varchar(64),
    phone varchar(64),
);

desc tbltest;
select * from tbltest;

show tables;