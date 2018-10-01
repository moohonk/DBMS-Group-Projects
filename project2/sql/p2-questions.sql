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
SELECT Student.login, sum(Scored.score)
FROM Student, Scored
WHERE Student.login = Scored.login

/* Problem 2.5 */
SELECT max(max_score)
FROM Problem
WHERE aid = 'Rachel Moran'

/* Problem 2.6 */
SELECT P.pname
FROM Problem as P
WHERE (SELECT count(S.score) FROM scored as S WHERE S.pid = P.pid) > 2

/* Problem 2.7 */
