create table t1 ( id1 int )
create table t2 (id2 int) 

insert into t1 values (null)
insert into t1 values (2)

insert into t2 values (null)
insert into t2 values (1)
insert into t2 values (1)

select * from t1 
select * from t2 

select * from t1 inner join t2 on t1.id1 =  t2.id2   --- 6 +1 +1 = 8

select * from t1 left join t2 on t1.id1 = t2.id2  ---

select * from t1 right join t2 on t1.id1 = t2.id2  -- 10 +1+1 = 12

select * from t1 full outer  join t2 on t1.id1 = t2.id2   -- 6 + 1+1 = 8 

select 3 *2 + 2*2 + 1 +1 +1 +1 




