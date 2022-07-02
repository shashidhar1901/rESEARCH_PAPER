CREATE TABLE research_paper
(
	title text,
	main_author text,
	valid_till text,
	venue text,
	paper_id text,
	abstract text
);

copy research_paper from 'C:\Users\thumu\Downloads\paper.csv' with csv;

CREATE TABLE venue
(
  venue text,
  paper_id text
);

INSERT INTO venue(venue,paper_id)
SELECT
	venue,
	paper_id
FROM
	research_paper;
	
CREATE TABLE co_authors
(
  paper_id text,
  author_name text
);

copy co_authors from 'C:\Users\thumu\Downloads\author.csv' with csv;

CREATE TABLE citations
(
  paper_id text,
  cited_paper_id text
);

copy citations from 'C:\Users\thumu\Downloads\citations.csv' with csv;