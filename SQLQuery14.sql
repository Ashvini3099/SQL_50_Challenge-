drop table friend ;

Create table friend (peronID int, friendID int)


insert into friend (peronID , friendID ) values (1,2);
insert into friend (peronID ,friendID ) values (1,3);
insert into friend (peronID , friendID ) values (2,1);
insert into friend (peronID , friendID ) values (2,3);
insert into friend (peronID , friendID ) values (3,5);
insert into friend (peronID , friendID ) values (4,2);
insert into friend (peronID , friendID ) values (4,3);
insert into friend (peronID , friendID ) values (4,5);


create table person (PersonID int,	Name varchar(50),	Score int)

insert into person(PersonID,Name ,Score) values(1,'Alice',88)
insert into person(PersonID,Name ,Score) values(2,'Bob',11)
insert into person(PersonID,Name ,Score) values(3,'Devis',27)
insert into person(PersonID,Name ,Score) values(4,'Tara',45)
insert into person(PersonID,Name ,Score) values(5,'John',63)

select * from person
select * from friend
with score_details as (
select f.peronID,sum(p.Score) as total_fried_score , count(1) as no_of_friend from friend f inner join person p 
on f.friendID = p.PersonID group by f.peronID 
having sum(p.Score) > 100 
) 
select s. * , p.Name as person_name from person p inner join score_details s on p.PersonID = s. peronID 

