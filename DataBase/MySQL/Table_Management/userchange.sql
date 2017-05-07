
insert into userchange
	select
	t1.tid,
	t1.sid,
	t1.uid,
	t2.ask-t1.ask,
	t2.answer-t1.answer,
	t2.post-t1.post,
	t2.agree-t1.agree,
	t2.thanks-t1.thanks,
	t2.follower-t1.follower,
	t2.followee-t1.followee,
	t2.fav-t1.fav,
	t2.logs-t1.logs,
	t2.marked-t1.marked,
	t2.mostvote-t1.mostvote,
	t2.mostvote5-t1.mostvote5,
	t2.mostvote10-t1.mostvote10,
	t2.count10000-t1.count10000,
	t2.count5000-t1.count5000,
	t2.count2000-t1.count2000,
	t2.count1000-t1.count1000,
	t2.count500-t1.count500,
	t2.count200-t1.count200,
	t2.count100-t1.count100
	from usersnapshots as t1 inner join usersnapshots as t2 on t1.sid+1=t2.sid where t1.uid=t2.uid order by t1.tid;

insert into usersrank
	select
	t1.tid,
	t1.sid,
	t1.uid,
	
	from usersnapshots as t1 inner join usersnapshots as t2

select count(t1.*) from usersnapshots as t1 inner join usersnapshots as t2 where 

select count(a.*) from usersnapshots a where a.ask >= (select b.ask from usersnapshots b where a.sid=28 and b.sid=28);

-- -- rank rate
-- select count(*)
-- from usersnapshots a inner join usersnapshots b on a.uid=b.uid
-- where a.ask >= (select b.ask from )

select count(a.tid),count(b.tid)
from usersnapshots as a ,usersnapshots as b
on a.uid =b.uid
and a.ask > b.ask
and a.tid != b.tid
and a.uid = '1';