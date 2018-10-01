/* Problem 2.1 */
SELECT * FROM Student;
SELECT * FROM Contest;
SELECT * FROM Participated;
SELECT * FROM Author;
SELECT * FROM Problem;
SELECT * FROM Scored;
SELECT * FROM Contest_Problems

/* Problem 2.2 */
SELECT sname, grad_year
FROM Student
WHERE university='University of Oklahoma';

/* Problem 2.3 */
SELECT Contest_Problems.cname, Problem.pname
FROM Contest_Problems, Problem
WHERE Contest_Problems.pid = Problem.pid;

/* Problem 2.4 */
SELECT Scored.login, SUM(Scored.score) AS sum
FROM Scored
GROUP BY Scored.login;

/* Problem 2.5 */
SELECT pname
FROM Problem
WHERE max_score=(SELECT MAX(max_score) FROM Problem) 
AND 
Problem.aid=(SELECT Author.aid FROM Author WHERE Author.aname='Rachel Moran') 

/* Problem 2.6 */
SELECT pname, total FROM Problem
LEFT JOIN
(
    SELECT COUNT(login) AS total, pid
    FROM Scored
    GROUP BY pid
) AS Totals
ON Problem.pid = Totals.pid
WHERE Totals.total > 2;

/* Problem 2.7 */
SELECT cname, SUM(compensation)
FROM Contest_Problems 
LEFT JOIN Problem ON Contest_Problems.pid = Problem.pid
LEFT JOIN Author ON Problem.aid = Author.aid
GROUP BY cname

/* Problem 2.8  */
SELECT cname, MAX(total)
FROM (
    SELECT cname, login, SUM(score) AS total
	FROM Scored LEFT JOIN Contest_Problems ON Scored.pid = Contest_Problems.pid
	GROUP BY cname, login
) AS S
GROUP BY S.cname


/* Problem 2.10 */
DELETE FROM Student
WHERE grad_year=2018;