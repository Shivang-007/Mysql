/*creating stored procedure*/

delimiter //
create procedure sp_getAll()
begin 
select * from studinfo;
end //
delimiter ;

/*calling stored procedure*/
call sp_getAll();

/*creating stored procedure for second table*/
delimiter //
create procedure sp_getAll2()
begin 
select * from studmarks;
end //
delimiter ;

call sp_getAll2();

/* procedure with parameter*/
delimiter //
create procedure sp_getAge(IN stud_name varchar(20))
begin 
select * from studinfo where name=stud_name;
end //
delimiter ;

/* calling parameterized procedure */
call sp_getAge('shubham');

delimiter //
create procedure sp_getStudent(IN sub_name varchar(20))
begin 
select * from studinfo where subject=sub_name;
end //
delimiter ;

/* dropping procedure*/
drop procedure sp_getStudent;

delimiter //
create procedure sp_getStudent(IN sub_name varchar(20))
begin 
select * from studmarks where subject=sub_name;
end //
delimiter ;

call sp_getStudent('english');

/* view all procedure */

show procedure status;
 
/* with two parameter */

delimiter //
create procedure sp_getMarksSubject(marks int,sub varchar(20))
begin 
select * from studentData where smarks=marks and subject=sub;
end //
delimiter ; 

call sp_getMarksSubject(34,'maths');

/* even odd program */

delimiter //
create procedure sp_getEvenOdd(num int)
begin 
if num%2=0 then
select 'number is even';
else
select 'number is odd';
end if;	
end //
delimiter ; 

call sp_getEvenOdd(8);

/* output parameter */
delimiter //
create procedure sp_sum(in num1 int,in num2 int,out result int)
begin 
set result=num1+num2;
end //
delimiter ;

call sp_sum(10,30,@sum);
select @sum;

