SELECT 
(
	select c2.title 
	from research_paper c2
	where c.paper_id = c2.paper_id 
),c.paper_id, COUNT(*) as no_of_papers_cited

from citations c 
GROUP BY c.paper_id
ORDER BY no_of_papers_cited DESC
limit 20;