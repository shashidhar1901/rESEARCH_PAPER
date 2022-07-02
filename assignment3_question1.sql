SELECT * 
FROM citations 
INNER JOIN research_paper 
ON citations.cited_paper_id = research_paper.paper_id
order by citations.paper_id;