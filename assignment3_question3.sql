select t1.paper_id,t2.cited_paper_id
from citations t1
join citations t2
on t1.cited_paper_id=t2.paper_id
where t1.paper_id!=t2.cited_paper_id
order by paper_id;

select distinct pairing from tempo
group by pairing
having count(pairing)>1