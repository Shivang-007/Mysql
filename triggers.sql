/* Trigger */

create table stud_audit(id int primary key auto_increment,audit_description varchar(500));


/* after Insert Trigger*/
delimiter //
create trigger tr_afterInsert
after insert on studinfo
for each row
begin
insert into stud_audit values(null,concat('a new row inserted at ',date_format(now(),'%d-%m-%y %h:%i:%s %p')));
end //
delimiter ;

       

insert into studinfo values(null,'aman',24);
select * from studinfo;
select * from stud_audit;
/*
delimiter //
create trigger tr_afterInsert1
after insert on studinfo
for each row
begin
declare stud_name varchar(10);
set stud_name=new.name;
insert into stud_audit values(null,concat('a new row is inserted in studinfo table with name ',stud_name,' at ',date_format(now(),'%d-%m-%y %h:%i:%s %p')));
end //
delimiter ;

insert into studinfo values(null,'milan',25);
*/

/* dropping trigger*/

DROP TRIGGER tr_afterInsert1;

delimiter //
create trigger tr_afterInsert1
after insert on studinfo
for each row
begin
declare stud_name varchar(10);
set stud_name=new.name;
insert into stud_audit values(null,concat('a new row is inserted in studinfo table with name ',stud_name,' at ',date_format(now(),'%d-%m-%y %h:%i:%s %p')));
end //
delimiter ;

insert into studinfo values(null,'milan',25);
select * from studinfo;
select * from stud_audit;

/* to view all triggers 8*/

show triggers;

/* after Delete Trigger*/
delimiter //
create trigger tr_afterDelete
after delete on studinfo
for each row
begin
declare stud_id int;
set stud_id=old.id;
insert into stud_audit values(null,concat('a row is deleted from studinfo table with id ',stud_id,' at ',date_format(now(),'%d-%m-%y %h:%i:%s %p')));
end //
delimiter ;

delete from studinfo where id=10;
select * from stud_audit;

/*after update Trigger*/
delimiter //
create trigger tr_afterUpdate
after update on studinfo
for each row
begin
declare insert_stud_name varchar(20);
declare delete_stud_name varchar(20);
set insert_stud_name=new.name;
set delete_stud_name=old.name;
insert into stud_audit values(null,concat('a ',delete_stud_name,' is ','replaced with ',insert_stud_name,' at ',date_format(now(),'%d-%m-%y %h:%i:%s %p')));
end //
delimiter ;

update studinfo set name='maulik' where id=16;
select * from stud_audit;

/* before insert trigger */

delimiter //
create trigger tr_beforeInsert
before insert on studinfo
for each row
begin
declare stud_age int;
set stud_age=new.age;
if stud_age<18 then
signal sqlstate '45000' set message_text='you are not eligible';
end if;
end //
delimiter ;

drop trigger tr_beforeInsert;

delimiter //
create trigger tr_beforeInsert
before insert on studinfo
for each row
begin
declare stud_age int;
set stud_age=new.age;
if stud_age<18 then
signal sqlstate '45000' set message_text='you are not eligible';
end if;
end //
delimiter ;

insert into studinfo values(null,'kartik',16);
