create table tempo
(
	nid text,
	pairing text
);

insert into tempo
(
	select t1.paper_id,CONCAT(t1.author_name,',',t2.author_name) from co_authors t1
	inner join co_authors t2 on t1.paper_id=t2.paper_id
	where t1.author_name!=t2.author_name and (t1.author_name < t2.author_name OR t2.author_name IS NULL)
);
 
select distinct pairing from tempo
group by pairing
having count(pairing)>1;