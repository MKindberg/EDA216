#a)
SELECT firstName, lastName FROM students;

#b)
SELECT firstName, lastName FROM students ORDER BY firstName, lastName;

#c)
SELECT firstName, lastName FROM students WHERE pNbr like '85%';

#d)
SELECT * FROM students WHERE mod(substr(pNbr, 10, 1), 2)=0;

#e)
SELECT COUNT(*) as 'Number of Students' FROM students;

#f)
SELECT courseName from courses WHERE courseCode like 'FMA%';

#g)
SELECT courseName from courses WHERE credits>7.5;

#h)
SELECT level, COUNT(*) AS 'Number of courses' FROM courses GROUP BY level;

#i)
SELECT courseCode FROM takenCourses WHERE pNbr='910101-1234';

#j)
SELECT courseName, credits FROM courses NATURAL JOIN takenCourses WHERE pNbr='910101-1234';

#k)
SELECT SUM(credits) FROM courses NATURAL JOIN takenCourses WHERE pNbr='910101-1234';

#l)
SELECT AVG(credits) FROM courses NATURAL JOIN takenCourses WHERE pNbr='910101-1234';

#m)
SELECT courseCode FROM takenCourses NATURAL JOIN students WHERE firstName = 'Eva' and lastName = 'Alm';
SELECT courseName, credits FROM courses NATURAL JOIN takenCourses NATURAL JOIN students WHERE firstName = 'Eva' and lastName = 'Alm';
SELECT SUM(credits) FROM courses NATURAL JOIN takenCourses NATURAL JOIN students WHERE firstName = 'Eva' and lastName = 'Alm';
SELECT AVG(credits) FROM courses NATURAL JOIN takenCourses NATURAL JOIN students WHERE firstName = 'Eva' and lastName = 'Alm';

#n)
SELECT firstName, lastName FROM students WHERE pNbr not in (SELECT pNbr FROM takenCourses);

#o)
CREATE VIEW AverageGrade AS SELECT firstName, lastName AVG(grade) as 'avgGrade' FROM takenCourses NATURAL JOIN students GROUP BY pNbr;
SELECT firstName, lastName, MAX(avgGrade) FROM AverageGrade;
SELECT * FROM AverageGrade WHERE avgGrade>4 ORDER BY avgGrade DESC;

#p)
CREATE VIEW CredSum AS SELECT pNbr, sum(credits) AS 'sum' FROM courses NATURAL JOIN takenCourses GROUP BY pNbr;
SELECT students.pNbr, COALESCE(sum,0) FROM students LEFT OUTER JOIN credSum ON students.pNbr=credSum.pNbr ORDER BY sum;

#q)
SELECT DISTINCT s1.* FROM students AS s1, students AS s2 WHERE s1.firstName=s2.firstName AND s1.lastName=s2.lastName AND s1.pNbr<>s2.pNbr;
