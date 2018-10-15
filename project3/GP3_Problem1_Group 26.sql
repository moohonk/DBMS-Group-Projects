/** Problem 1 **/

CREATE INDEX Problem_aid_index
ON Problem(aid);

/* Problem 2.5 */
SELECT pname
FROM Problem
WHERE max_score=(SELECT MAX(max_score) FROM Problem) 
AND 
Problem.aid=(SELECT Author.aid FROM Author WHERE Author.aname='Rachel Moran');

/* Problem 2.7 */
SELECT cname, SUM(compensation)
FROM Contest_Problems 
LEFT JOIN Problem ON Contest_Problems.pid = Problem.pid
LEFT JOIN Author ON Problem.aid = Author.aid
GROUP BY cname;