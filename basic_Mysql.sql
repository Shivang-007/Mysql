/*created database.*/
 
create database student;

use student;

/*studinfo table is created.*/

create table studinfo(id int not null auto_increment primary key,name varchar(20),age int);

/*then data is inserted using insert into command.*/

/*second table is created .*/

create table studinfo(sid int not null,smarks int, subject varchar(20),id int,foreign key(id) refernces studinfo(id));

/*display total number of student who have taken english subject.*/

select count(sid) from studmarks where subject="english";

/*update studinfo.*/

 update studinfo set age=25 where name='aakash';

/*display record of student whose name is end with 'rav'.*/

select * from studinfo where name like "%rav";

/*display record of student whose name contain 'sh'.*/

select * from studinfo where name like "%sh%";

/*display record of student whose age is greater than 20.*/

select * from studinfo where name like age>20;

/*display record of student whose age is greater than 22 and less than 25.*/

select * from studinfo where age between 22 and 25;

/*delete record from studinfo whose id=12.*/

 delete from studinfo where id=12;

/*copy table.*/

create table school(sid int ,sname varchar(20),sage int);
insert into school select * from studinfo;


/*delete table from database.*/

drop table school;

/*performing Join operation.*/

/*Inner Join.*/

select name,smarks,subject from studinfo s join studmarks m on s.id=m.id;

/*Left Join.*/

select * from studinfo s left join studmarks m on s.id=m.id;

/*Right join.*/

select name,smarks from studinfo s right join studmarks m on s.id=m.id where subject='science';

/*return record of student who have get marks>40 in maths.*/

select name,smarks from studinfo s right join studmarks m on s.id=m.id where smarks>40 and subject="maths";

/*return name,marks of student who have get marks>40 in science.*/

select name,smarks from studinfo s right join studmarks m on s.id=m.id where smarks>40 and subject="science";

/*return name,marks of student who get highest marks in science.*/

select name,smarks from studinfo s inner join studmarks m on s.id=m.id where subject="science" order by smarks desc limit 1;

/*return name of student who have take subject hindi.*/

select name from studinfo s inner join studmarks m on s.id=m.id where subject="hindi";