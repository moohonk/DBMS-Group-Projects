/* DDL */
CREATE TABLE Participated(
    login varchar(50),
    cname varchar(50),
    PRIMARY KEY (login, cname),
    FOREIGN KEY (login) REFERENCES Student(login),
    FOREIGN KEY (cname) REFERENCES Contest(cname)
);

CREATE TABLE Author(
    aid int,
    aname varchar(50),
    compensation int,
    PRIMARY KEY (aid)
);

CREATE TABLE Problem(
    pid int,
    pname varchar(50),
    max_score int,
    aid int,
    FOREIGN KEY (aid) REFERENCES Author(aid),
    PRIMARY KEY (pid)
);

CREATE TABLE Scored(
    pid int,
    login varchar(50),
    score REAL,
    FOREIGN KEY (pid) REFERENCES Problem(pid),
    FOREIGN KEY (login) REFERENCES Student(login),
    PRIMARY KEY (pid, login)
);

CREATE TABLE Contest_Problems(
    cname varchar(50),
    pid int,
    FOREIGN KEY (cname) REFERENCES Contest(cname),
    FOREIGN KEY (pid) REFERENCES Problem(pid),
    PRIMARY KEY (cname, pid)
);


/* Insertions */
INSERT INTO Author VALUES (101, 'Alexander Sforza', 2000)
INSERT INTO Author VALUES (102, 'Rachel Moran', 1500)
INSERT INTO Author VALUES (103, 'David Terans', 2000)
INSERT INTO Author VALUES (104, 'Elizabeth Forster', 2500)

INSERT INTO Contest VALUES ('Week of Code', 2016, 'Norman, OK')
INSERT INTO Contest VALUES ('University Codesprint', 2017, 'College Station, TX')
INSERT INTO Contest VALUES ('Hour Rank', 2018, 'Norman, OK')

INSERT INTO Contest_Problems VALUES ('Week of Code',10)
INSERT INTO Contest_Problems VALUES ('Week of Code',11)
INSERT INTO Contest_Problems VALUES ('Week of Code',12)
INSERT INTO Contest_Problems VALUES ('Week of Code',13)
INSERT INTO Contest_Problems VALUES ('University Codesprint',14)
INSERT INTO Contest_Problems VALUES ('University Codesprint',15)
INSERT INTO Contest_Problems VALUES ('University Codesprint',16)
INSERT INTO Contest_Problems VALUES ('Hour Rank',17)
INSERT INTO Contest_Problems VALUES ('Hour Rank',18)
INSERT INTO Contest_Problems VALUES ('Hour Rank',19)

INSERT INTO Participated VALUES ('1udaya1', 'Week of Code')
INSERT INTO Participated VALUES ('mightybruce', 'Week of Code')
INSERT INTO Participated VALUES ('jose1980', 'Week of Code')
INSERT INTO Participated VALUES ('moerman', 'University Codesprint')
INSERT INTO Participated VALUES ('grice', 'University Codesprint')
INSERT INTO Participated VALUES ('stefan', 'University Codesprint')
INSERT INTO Participated VALUES ('stefan', 'Hour Rank')
INSERT INTO Participated VALUES ('cfox', 'Hour Rank')
INSERT INTO Participated VALUES ('_ash_', 'Hour Rank')

INSERT INTO Problem VALUES (10, 'Exceeding the Speed Limit', 10, 101)
INSERT INTO Problem VALUES (11, 'Array Triplets', 20, 102)
INSERT INTO Problem VALUES (12, 'a,b Special Points', 30, 104)
INSERT INTO Problem VALUES (13, 'Cube-loving Numbers', 50, 103)
INSERT INTO Problem VALUES (14, 'Interesting Trip', 15, 104)
INSERT INTO Problem VALUES (15, 'Sword Profit', 20, 103)
INSERT INTO Problem VALUES (16, 'Which Section?', 40, 103)
INSERT INTO Problem VALUES (17, 'Minute to Win It', 10, 103)
INSERT INTO Problem VALUES (18, 'Watson\'s Love for Arrays', 30, 102)
INSERT INTO Problem VALUES (19, 'Dynamic Trees', 50, 102)

INSERT INTO Scored VALUES (10, '1udaya1',  10)
INSERT INTO Scored VALUES (10, 'mightybruce',  8)
INSERT INTO Scored VALUES (10, 'jose1980',  51)
INSERT INTO Scored VALUES (11, '1udaya1',  20)
INSERT INTO Scored VALUES (11, 'jose1980',  8)
INSERT INTO Scored VALUES (12, 'mightybruce',  10)
INSERT INTO Scored VALUES (12, 'jose1980',  20)
INSERT INTO Scored VALUES (13, 'jose1980',  35)
INSERT INTO Scored VALUES (14, 'moerman',  10)
INSERT INTO Scored VALUES (14, 'grice',  15)
INSERT INTO Scored VALUES (14, 'stefan',  14)
INSERT INTO Scored VALUES (15, 'moerman',  19)
INSERT INTO Scored VALUES (15, 'stefan',  18)
INSERT INTO Scored VALUES (16, 'grice',  33)
INSERT INTO Scored VALUES (17, 'stefan',  10)
INSERT INTO Scored VALUES (17, '_ash_',  10)
INSERT INTO Scored VALUES (17, 'cfox',  9)
INSERT INTO Scored VALUES (18, 'stefan',  27)
INSERT INTO Scored VALUES (18, '_ash_',  18)
INSERT INTO Scored VALUES (19, 'stefan',  41)

INSERT INTO Student VALUES ('stefan', 'Stefan Keller', 'University of Oklahoma', 2020)
INSERT INTO Student VALUES ('cfox', 'Colin Fox', 'Oklahoma State University', 2021)
INSERT INTO Student VALUES ('moerman', 'Fientje Moerman', 'Oklahoma State University', 2019)
INSERT INTO Student VALUES ('grice', 'George Rice', 'Texas A&M University', 2019)
INSERT INTO Student VALUES ('1udaya1', 'Udaya Chandrika', 'Baylor University', 2018)
INSERT INTO Student VALUES ('mightybruce', 'Bruce Yamashita', 'Texas A&M University', 2018)
INSERT INTO Student VALUES ('_ash_', 'Ashley Brzozowicz', 'University of Oklahoma', 2020)
INSERT INTO Student VALUES ('jose1980', 'Jose Monteiro', 'Texas Christian University', 2018)


/* Problem 2 Questions */
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

/* Problem 2.9 */
UPDATE Author SET compensation=1.1*compensation WHERE Author.aid IN 
(
    SELECT Problem.aid
    FROM Problem
    WHERE Problem.pid IN
    (
        SELECT Num.pid FROM
            (
            SELECT Scored.pid, COUNT(*) AS count
            FROM Scored LEFT JOIN Problem ON Scored.pid = Problem.pid
            WHERE score >= 0.5 * max_score AND score <= 0.75 * max_score
            GROUP BY Scored.pid) AS NumInRange 
            LEFT JOIN 
            (
            SELECT Scored.pid, COUNT(*) AS count
            FROM Scored LEFT JOIN Problem ON Scored.pid = Problem.pid
            GROUP BY Scored.pid) AS Num ON Num.pid = NumInRange.pid
            WHERE Num.count = NumInRange.count
        )
    )

/* Problem 2.10 */
DELETE FROM Participated WHERE login IN
(
    SELECT login
    FROM Student
    WHERE grad_year=2018
);

DELETE FROM Scored WHERE login IN
(
    SELECT login
    FROM Student
    WHERE grad_year=2018
)

DELETE 
FROM Student
WHERE grad_year=2018