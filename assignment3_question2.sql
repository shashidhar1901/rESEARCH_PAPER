SELECT citations.cited_paper_id as citing_paper,citations.paper_id as cited_paper,research_paper.title as cited_paper,research_paper.main_author as author,research_paper.valid_till as valid_year,research_paper.venue
FROM citations  
INNER JOIN research_paper
ON citations.paper_id = research_paper.paper_id
ORDER BY citations.cited_paper_id ASC;
