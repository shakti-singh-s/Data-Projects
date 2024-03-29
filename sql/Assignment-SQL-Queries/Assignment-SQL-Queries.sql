USE OverallPractice

CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

SELECT * FROM studies

INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000);

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

SELECT * FROM software

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

SELECT * FROM programmer

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);


SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer

--Tasks To Be Performed:
--1. Find out the selling cost average for packages developed in Pascal.

SELECT AVG(SCOST) AS 'selling cost average for packages developed in Pascal' FROM software
WHERE DEVELOPIN = 'PASCAL'

--2. Display the names and ages of all programmers.

SELECT PNAME, DATEDIFF(YEAR,DOB,GETDATE()) AS Age FROM programmer

--3. Display the names of those who have done the DAP Course.

SELECT PNAME AS 'those who have done the DAP Course'  FROM studies
WHERE COURSE = 'DAP'

--4. Display the names and date of birth of all programmers born in January.

SELECT PNAME,DOB FROM programmer
WHERE MONTH(DOB)=01

--5. What is the highest number of copies sold by a package?

SELECT DEVELOPIN, MAX(SOLD) AS 'highest number of copies sold'  FROM software GROUP BY DEVELOPIN

--6. Display lowest course fee.

SELECT INSTITUTE,MIN(COURSE_FEE) AS 'lowest course fee' FROM studies 
GROUP BY INSTITUTE

--7. How many programmers have done the PGDCA Course?

SELECT COUNT(*) AS 'Count_PGDCA Course' FROM studies
WHERE COURSE = 'PGDCA'


--8. How much revenue has been earned through sales of packages
--developed in C?

SELECT SUM(SCOST * SOLD) AS 'Revenue_Packge_C' FROM software
WHERE DEVELOPIN = 'C'


--9. Display the details of the software developed by Ramesh.

SELECT * FROM software
WHERE PNAME='RAMESH'

--10. How many programmers studied at Sabhari?

SELECT COUNT(*) AS 'Programmer_Count_Sabhari' FROM studies
WHERE INSTITUTE='SABHARI'

SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer


--11. Display details of packages whose sales crossed the 2000 mark.

SELECT DEVELOPIN,SUM(SCOST * SOLD) AS Revenue FROM software
GROUP BY DEVELOPIN
HAVING SUM(SCOST * SOLD) > 20000

--12. Display the details of packages for which development costs have been
--recovered.

SELECT * FROM software
WHERE SCOST * SOLD < DCOST

--13. What is the cost of the costliest software development in Basic?

SELECT DCOST AS Costliest_Software FROM software WHERE DCOST = (SELECT MAX(DCOST) FROM software)

--14. How many packages have been developed in dBase?

SELECT COUNT(*) AS Count_Dbase FROM software
WHERE DEVELOPIN='DBASE'

--15. How many programmers studied in Pragathi?

SELECT COUNT(*) AS Count_Prgathi FROM studies
WHERE INSTITUTE='PRAGATHI'

--16. How many programmers paid 5000 to 10000 for their course?

SELECT COUNT(*) AS Count_PaidBetween5000To10000 FROM studies
WHERE COURSE_FEE BETWEEN 5000 AND 10000

--17. What is the average course fee?

SELECT Avg(COURSE_FEE) AS Avg_COURSE_FEE FROM studies

--18. Display the details of the programmers knowing C.

SELECT * FROM programmer
WHERE PROF1='C' OR PROF2='C'

--19. How many programmers know either COBOL or Pascal?

SELECT COUNT(*) AS 'either COBOL or Pascal' FROM programmer
WHERE PROF1 IN ('COBOL','PASCAL') OR PROF2 IN ('COBOL','PASCAL')

SELECT COUNT(*)
FROM PROGRAMMER
WHERE PROF1 = 'Pascal' OR PROF2 = 'Pascal'
   OR PROF1 = 'C' OR PROF2 = 'C';


--20. How many programmers don’t know Pascal and C?

SELECT COUNT(*) AS 'don’t know Pascal and C' FROM programmer
WHERE PROF1 NOT IN ('C','PASCAL') AND PROF2 NOT IN ('C','PASCAL')

SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer

--21. How old is the oldest male programmer?

SELECT MAX(DATEDIFF(YEAR,DOB,GETDATE())) AS Age FROM programmer
WHERE GENDER='M'

--22. What is the average age of female programmers?

SELECT AVG(DATEDIFF(YEAR,DOB,GETDATE())) AS Age FROM programmer
WHERE GENDER='F'

--23. Calculate the experience in years for each programmer and display with
--their names in descending order.

SELECT PNAME,DATEDIFF(YEAR,DOJ,GETDATE()) AS 'experience in years' FROM programmer
ORDER BY PNAME DESC
--24. Who are the programmers who celebrate their birthdays during the
--current month?

SELECT * FROM programmer
WHERE MONTH(DOB)=MONTH(GETDATE())

--25. How many female programmers are there?

SELECT COUNT(*) AS Female_programmers FROM programmer
WHERE GENDER='F'

--26. What are the languages studied by male programmers?

SELECT DISTINCT PROF1 FROM programmer
WHERE GENDER='M' 
UNION
SELECT DISTINCT PROF2 FROM programmer
WHERE GENDER='M' 

--27. What is the average salary?

SELECT AVG(SALARY) AS 'average salary' FROM programmer

--28. How many people draw a salary between 2000 to 4000?

SELECT COUNT(*) AS 'salary between 2000 to 4000' FROM programmer
WHERE SALARY BETWEEN 2000 AND 4000

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.

SELECT * FROM programmer
WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL') AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL')

--30. Display the cost of packages developed by each programmer.

SELECT PNAME,DCOST FROM software

SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer

--31. Display the sales value of the packages developed by each
--programmer.

SELECT PNAME,SUM(SCOST *SOLD) AS Sales FROM software
GROUP BY PNAME
ORDER BY Sales DESC

--32. Display the number of packages sold by each programmer.

SELECT PNAME,TITLE, DEVELOPIN,SOLD AS Packages_Sold FROM software
ORDER BY Packages_Sold DESC

--33. Display the sales cost of the packages developed by each programmer
--language wise.

SELECT PNAME, DEVELOPIN,SCOST FROM software
ORDER BY DEVELOPIN,SCOST

--34. Display each language name with the average development cost,
--average selling cost and average price per copy.

SELECT DEVELOPIN,AVG(DCOST) AS 'average development cost',AVG(SCOST) AS 'average selling cost' FROM software
GROUP BY DEVELOPIN

--35. Display each programmer’s name and the costliest and cheapest
--packages developed by him or her.

SELECT PNAME, MIN(SCOST) AS 'cheapest', MAX(SCOST) AS 'costliest' FROM software
GROUP BY PNAME

--36. Display each institute’s name with the number of courses and the
--average cost per course.

SELECT INSTITUTE,COUNT(COURSE) AS Course_count,AVG(COURSE_FEE) AS Avg_Course_fee FROM studies
GROUP BY INSTITUTE

--37. Display each institute’s name with the number of students.

SELECT INSTITUTE, COUNT(PNAME) AS 'number of students' FROM studies
GROUP BY INSTITUTE

--38. Display names of male and female programmers along with their
--gender.

SELECT PNAME, GENDER FROM programmer
ORDER BY GENDER

--39. Display the name of programmers and their packages.

SELECT PNAME, TITLE FROM software

--40. Display the number of packages in each language except C and C++.

SELECT DEVELOPIN,COUNT(*) AS 'Count_language except C and C++' FROM software
WHERE DEVELOPIN NOT IN ('C')
GROUP BY DEVELOPIN

SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer

--41. Display the number of packages in each language for which
--development cost is less than 1000.

SELECT DEVELOPIN,COUNT(*) FROM software
WHERE DCOST < 1000
GROUP BY DEVELOPIN

--42. Display the average difference between SCOST and DCOST for each
--package.

SELECT DISTINCT DEVELOPIN, AVG(SCOST - DCOST) FROM software
GROUP BY DEVELOPIN

--43. Display the total SCOST, DCOST and the amount to be recovered for
--each programmer whose cost has not yet been recovered.

SELECT PNAME,SUM(SCOST) AS total_SCOST,SUM(DCOST) AS total_DCOST,SUM(DCOST - SCOST * SOLD) AS Amount_to_be_recovered FROM software
GROUP BY PNAME
HAVING SUM(DCOST - SCOST * SOLD) > 0

--44. Display the highest, lowest and average salaries for those earning more
--than 2000.

SELECT MAX(SALARY)AS highest, MAX(SALARY) AS lowest,AVG(SALARY) AS average FROM programmer
WHERE SALARY > 2000

--45. Who is the highest paid C programmer?

SELECT TOP 1 PNAME,SALARY FROM programmer
WHERE PROF1 ='C' OR PROF2 = 'C'
ORDER BY SALARY DESC

--46. Who is the highest paid female COBOL programmer?

SELECT TOP 1 PNAME,SALARY FROM programmer
WHERE PROF1 ='COBOL' OR PROF2 = 'COBOL' AND GENDER='F'
ORDER BY SALARY DESC

--47. Display the names of the highest paid programmers for each language.

Select MAX(s.PNAME) AS Programmers, max(p.SALARY) AS Salary_paid ,DEVELOPIN from  PROGRAMMER P inner join software s on s.PNAME=p.PNAME
GROUP BY DEVELOPIN


--48. Who is the least experienced programmer?

with cet as
(SELECT PNAME, DATEDIFF(YEAR,DOJ,GETDATE()) AS experience FROM programmer)
SELECT * FROM cet WHERE experience IN (SELECT MIN(experience) FROM cet)

--49. Who is the most experienced male programmer knowing PASCAL?

SELECT PNAME,SALARY FROM programmer where 

--50. Which language is known by only one programmer?

SELECT * FROM studies
SELECT * FROM software
SELECT * FROM programmer

--2nd highest salary in programmer

SELECT MAX(SALARY) AS Second_Highest_Salary FROM programmer WHERE SALARY NOT IN 
(SELECT MAX(SALARY) FROM programmer)

--SQL Query to find Max Salary from each department

SELECT GENDER, MAX(SALARY) Max_each_category FROM programmer GROUP BY GENDER

--Find the 3rd MAX salary in the table

SELECT DISTINCT SALARY FROM programmer p1 WHERE 3 =
(SELECT COUNT(DISTINCT SALARY) FROM programmer p2 WHERE p1.SALARY <=p2.SALARY)

--Find the 3rd MIN salary in the table

SELECT DISTINCT SALARY FROM programmer p1 WHERE 3 =
(SELECT COUNT(DISTINCT SALARY) FROM programmer p2 WHERE p1.SALARY >=p2.SALARY)

--Select FIRST n records from a table

SELECT TOP 3 SALARY FROM programmer ORDER BY SALARY DESC

SELECT TOP 3 *
FROM programmer
ORDER BY (SELECT 0);

--Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013"

SELECT CONVERT(varchar(20),DOJ,106) FROM programmer

--Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT CONVERT(varchar(20),DOJ,111) FROM programmer

--FORMAT - 15 Feb 2013 - 106
--		 - 2013/02/15 - 111
--		 - only time part - 108

--Get only Year part of "JoiningDate".

SELECT DATEPART(YEAR, DOB) FROM programmer

--Select first name from "EmployeeDetail" table prifixed with "Hello "

SELECT 'Hello' + ' ' + lower(PNAME) FROM programmer

--Select second highest salary from "EmployeeDetail" table.

SELECT TOP 1 SALARY FROM 
(SELECT TOP 5 SALARY FROM programmer ORDER BY SALARY DESC) T
ORDER BY SALARY ASC

--51. Who is the above programmer referred in 50?
--52. Who is the youngest programmer knowing dBase?
--53. Which female programmer earning more than 3000 does not know C,
--C++, Oracle or dBase?
--54. Which institute has the most number of students?
--55. What is the costliest course?
--56. Which course has been done by the most number of students?
--57. Which institute conducts the costliest course?
--58. Display the name of the institute and the course which has below
--average course fee.
--59. Display the names of the courses whose fees are within 1000 (+ or -) of
--the average fee.
--60. Which package has the highest development cost?
--61. Which course has below average number of students?
--62. Which package has the lowest selling cost?
--63. Who developed the package that has sold the least number of copies?
--64. Which language has been used to develop the package which has the
--highest sales amount?
--65. How many copies of the package that has the least difference between
--development and selling cost were sold?
--66. Which is the costliest package developed in Pascal?
--67. Which language was used to develop the most number of packages?
--68. Which programmer has developed the highest number of packages?
--69. Who is the author of the costliest package?
--70. Display the names of the packages which have sold less than the
--average number of copies.
--71. Who are the authors of the packages which have recovered more than
--double the development cost?
--72. Display the programmer names and the cheapest packages developed
--by them in each language.
--73. Display the language used by each programmer to develop the highest
--selling and lowest selling package.
--74. Who is the youngest male programmer born in 1965?
--75. Who is the oldest female programmer who joined in 1992?
--76. In which year was the most number of programmers born?
--77. In which month did the most number of programmers join?
--78. In which language are most of the programmer’s proficient?
--79. Who are the male programmers earning below the average salary of
--female programmers?
--SQL Certification Training
--80. Who are the female programmers earning more than the highest paid?
--81. Which language has been stated as the proficiency by most of the
--programmers?
--82. Display the details of those who are drawing the same salary.
--83. Display the details of the software developed by the male programmers
--earning more than 3000.
--84. Display the details of the packages developed in Pascal by the female
--programmers.
--85. Display the details of the programmers who joined before 1990.
--86. Display the details of the software developed in C by the female
--programmers at Pragathi.
--87. Display the number of packages, number of copies sold and sales value
--of each programmer institute wise.
--88. Display the details of the software developed in dBase by male
--programmers who belong to the institute in which the most number of
--programmers studied.
--89. Display the details of the software developed by the male programmers
--born before 1965 and female programmers born after 1975.
--90. Display the details of the software that has been developed in the
--language which is neither the first nor the second proficiency of the
--programmers.
--91. Display the details of the software developed by the male students at
--Sabhari.
--92. Display the names of the programmers who have not developed any
--packages.
--93. What is the total cost of the software developed by the programmers of
--Apple?
--94. Who are the programmers who joined on the same day?
--95. Who are the programmers who have the same Prof2?
--96. Display the total sales value of the software institute wise.
--97. In which institute does the person who developed the costliest package
--study?
--98. Which language listed in Prof1, Prof2 has not been used to develop any
--package?
--99. How much does the person who developed the highest selling package
--earn and what course did he/she undergo?
--100. What is the average salary for those whose software sales is more than
--50,000?
--101. How many packages were developed by students who studied in
--institutes that charge the lowest course fee?
--102. How many packages were developed by the person who developed the
--cheapest package? Where did he/she study?
--103. How many packages were developed by female programmers earning
--more than the highest paid male programmer?
--104. How many packages are developed by the most experienced
--programmers from BDPS?
--105. List the programmers (from the software table) and the institutes they
--studied at.
--106. List each PROF with the number of programmers having that PROF
--and the number of the packages in that PROF.
--107. List the programmer names (from the programmer table) and the
--number of packages each has developed.