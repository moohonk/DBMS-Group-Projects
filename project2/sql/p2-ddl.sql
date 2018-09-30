
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