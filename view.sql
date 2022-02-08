use student;
show tables;
select * from studinfo;
insert into studinfo values(13,"jay",23);
select * from studinfo;
select * from studmarks;
create view studentData as
select sid,smarks,subject,name from studinfo s join studmarks m on s.id=m.id;

select * from studentData;
savepoint v1;
