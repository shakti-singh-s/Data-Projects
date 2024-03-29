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
SELECT * FROM programmer
SELECT * FROM software

--1. Find out the selling cost AVG for packages developed in Pascal.

SELECT AVG(SCOST) AS avg_value FROM software WHERE developin='Pascal'

--2. Display Names, Ages of all Programmers.

SELECT pname, datediff(yy,dob,GETDATE())AS Age FROM programmer ORDER BY Age

--3. Display the Names of those who have done the DAP Course.

SELECT pname, course FROM studies where course='DAP'

--4. Display the Names and Date of Births of all Programmers Born in January.

SELECT pname, dob FROM programmer WHERE Month(dob)=1
SELECT pname, dob FROM programmer WHERE DATEPART(month, dob)=1

--5. What is the Highest Number of copies sold by a Package?

SELECT MAX(sold) AS max_sold FROM software

--6. Display lowest course Fee.

SELECT MIN(fee) as min_fees FROM studies

--7. How many programmers done the PGDCA Course?

SELECT COUNT(Pname) FROM studies WHERE Course='PGDCA'
SELECT COUNT(pname) FROM STUDIES WHERE COURSE LIKE 'PGDCA';

--8. How much revenue has been earned thru sales of Packages Developed in C.

SELECT SUM(scost*sold) as Revenue FROM software WHERE Developin='C'

--9. Display the Details of the Software Developed by Ramesh.

SELECT * FROM Software WHERE pname='Ramesh'

--10. How many Programmers Studied at Sabhari?

SELECT COUNT(DISTINCT pname) AS 'Count_studied from Sabhari' FROM studies WHERE Institute='Sabhari'

--11. Display details of Packages whose sales crossed the 2000 Mark.

SELECT title, SUM(SCOST*SOLD) AS Sales FROM software
GROUP BY Title
HAVING SUM(SCOST*SOLD)>2000
ORDER BY Sales DESC

--12. Display the Details of Packages for which Development Cost have been recovered.

SELECT title, SUM(SCOST*SOLD) AS Sales FROM software
GROUP BY Title
HAVING SUM(SCOST*SOLD)>SUM(dcost)

select * from software where scost*sold >= dcost;

--13. What is the cost of the costliest software development in Basic?

SELECT MAX(scost) as max_cost FROM software WHERE Developin='Basic'

--14. How many Packages Developed in DBASE?

SELECT COUNT(Title) AS COUNT from software WHERE Developin='dbase'

--15. How many programmers studied in Pragathi?

SELECT COUNT(DISTINCT pname) AS 'Count_Prog from Pragathi' FROM studies WHERE Institute='Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?

SELECT COUNT(Pname) AS 'Programmers Paid 5000 to 10000' FROM studies WHERE fee BETWEEN 5000 AND 10000

--17. What is AVG Course Fee

SELECT AVG(fee) as avg_fee FROM Studies 

--18. Display the details of the Programmers Knowing C.

SELECT * FROM programmer
WHERE prof1='c' OR prof2='c'

SELECT * FROM programmer
WHERE 'c' IN (prof1,prof2)

SELECT * FROM programmer WHERE prof1='c'
UNION
SELECT * FROM programmer WHERE prof2='c'

--19. How many Programmers know either COBOL or PASCAL.

SELECT COUNT(Pname) AS Count FROM programmer
WHERE 'cobol' IN (prof1,prof2) OR 'pascal' IN (prof1,prof2)

SELECT COUNT(Pname) AS Count FROM PROGRAMMER WHERE PROF1='COBOL' OR PROF1='PASCAL' OR PROF2='COBOL' OR PROF2='PASCAL';

--20. How many Programmers Don’t know PASCAL and C

SELECT COUNT(Pname) AS Count FROM programmer
WHERE 'pascal' NOT IN (prof1,prof2) AND 'C' NOT IN (prof1,prof2)

SELECT COUNT(Pname) AS Count FROM PROGRAMMER WHERE PROF1!='C' AND PROF1!='PASCAL' AND PROF2!='C' AND PROF2!='PASCAL';

--21. How old is the Oldest Male Programmer.

SELECT MAX(datediff(yy,dob,GETDATE())) AS OldestMale_Age FROM programmer WHERE Gender='M'

--22. What is the AVG age of Female Programmers?

SELECT AVG(datediff(yy,dob,GETDATE())) AS Avg_Female_Age FROM programmer WHERE Gender='F'

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

SELECT pname, datediff(yy,doj,GETDATE()) AS 'Experience in Years' FROM programmer ORDER BY 'Experience in Years' DESC

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?

SELECT pname FROM Programmer
WHERE MONTH(dob)=Month(GETDATE())

--25. How many Female Programmers are there?
SELECT COUNT(Pname) AS 'No of Female Programmers' FROM Programmer WHERE Gender='F'

--26. What are the Languages studied by Male Programmers.

SELECT pname,Prof1,prof2 FROM programmer WHERE Gender='M'

--27. What is the AVG Salary?

SELECT AVG(Salary) AS Avg_Salary FROM programmer

--28. How many people draw salary 2000 to 4000?

SELECT COUNT(Pname) AS 'Salary b/w 2000 to 4000' FROM Programmer
WHERE Salary BETWEEN 2000 AND 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.

SELECT * FROM Programmer 
WHERE 'Pascal' NOT IN (Prof1,Prof2) AND 'Clipper' NOT IN (prof1,prof2) AND 'Cobol' NOT IN (prof1,prof2)

select * from programmer where prof1<>'clipper' and prof1<>'cobol' and prof1<>'pascal' and prof2<>'clipper' and prof2<>'cobol' and prof2<>'pascal' ;

--30. Display the Cost of Package Developed By each Programmer

SELECT Pname,SUM(Scost) FROM Software GROUP BY Pname

--31. Display the sales values of the Packages Developed by the each Programmer.

SELECT Pname, SUM(Scost*Sold) FROM Software GROUP BY Pname

--32. Display the Number of Packages sold by Each Programmer.

SELECT Pname, SUM(Sold) FROM Software GROUP BY Pname

--33. Display the sales cost of the packages Developed by each Programmer Language wise.

select developin as language_wise ,sum(scost*sold) as sales_cost_of_package from software group by developin;

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 

SELECT developin AS LANGUAGE,AVG(DCOST) AS AVGDEVCOST,AVG(SCOST) AS AVGSELLCOST,AVG(SCOST) AS PRICEPERCPY
FROM SOFTWARE GROUP BY developin;

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 

SELECT pname As PRNAME,MIN(DCOST) As CHEAPEST,MAX(DCOST) AS COSTLIEST
FROM SOFTWARE GROUP BY pname;

--36. Display each institute name with number of Courses, Average Cost per Course. 

SELECT institute ,count(course) As number_of_courses, AVG(fee) AS AVG_cost_per_course
FROM studies GROUP BY institute;

--37. Display each institute Name with Number of Students. 

SELECT institute ,count(pname) As number_of_students
FROM studies GROUP BY institute;

--38. Display Names of Male and Female Programmers. Gender also. 
select pname, gender from programmer;

--39. Display the Name of Programmers and Their Packages. 

SELECT pname, Title AS packages_developed  FROM software;

--40. Display the Number of Packages in Each Language Except C and C++. 

select developin As language, count(title) As number_of_packages 
from software group by developin having developin<>'c' and developin!='c++';

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.

select developin As language, count(title) As number_of_packages 
from software where dcost<1000 group by developin;

--42. Display AVG Difference between SCOST, DCOST for Each Package. 

select title As each_package, Avg(scost-dcost) As Avg_difference
from software group by title; 


--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 

SELECT Pname, SUM(SCOST) AS SCOST, SUM(DCOST) AS DCOST, SUM(DCOST-(SOLD*SCOST)) AS 'amount to Be Recovered' FROM SOFTWARE 
GROUP BY pname HAVING SUM(DCOST)>SUM(SOLD*SCOST);

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 

SELECT MAX(SALARY) AS Highest_Salary, MIN(SALARY)AS Lowest_Salary, AVG(SALARY) AS Average_Salary FROM PROGRAMMER WHERE SALARY > 2000;

--45. Who is the Highest Paid C Programmers? 

SELECT * FROM PROGRAMMER WHERE SALARY =(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

--46. Who is the Highest Paid Female COBOL Programmer? 

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND gender LIKE 'F';

--47. Display the names of the highest paid programmers for each Language. 

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY)FROM PROGRAMMER where Gender= 'F')

--48. Who is the least experienced Programmer. 

SELECT(datepart(yy,GETDATE())-datepart(yy,Doj)) as EXP,pname FROM PROGRAMMER
where datepart(yy,GETDATE())-datepart(yy,Doj) in 
(select min(datepart(yy,GETDATE())-datepart(yy,Doj))as EXP FROM PROGRAMMER)


--49. Who is the most experienced male programmer knowing PASCAL. 

SELECT(datepart(yy,GETDATE())-datepart(yy,Doj)) as EXP,pname FROM PROGRAMMER
where Gender='M' and datepart(yy,GETDATE())-datepart(yy,Doj) in 
(select max(datepart(yy,GETDATE())-datepart(yy,Doj))as EXP FROM PROGRAMMER)

--50. Which language is known by only one programmer?

SELECT MIN(PNAME) AS Name,Language
FROM PROGRAMMER t
CROSS APPLY (VALUES(PROF1),(PROF2))p(Language)
GROUP BY Language
HAVING COUNT(DISTINCT PNAME) = 1

---51. Who is the Above Programmer Referred in 50? 

CREATE TABLE PSLang(PROF VARCHAR(20))

Select * from pslang

INSERT INTO PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer 
INNER JOIN PSLang ON
PROF=PROF1 OR PROF=PROF2

--52. Who is the Youngest Programmer knowing DBASE? 

SELECT pname, prof1, prof2, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As Age
from programmer where dob = (SELECT max(dob) from programmer where prof1='dbase' or prof2='dbase');


--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 

SELECT * FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY >3000 AND 
prof1<>'c' and prof1<>'c++' and prof1<>'oracle'and prof1<>'dbase' and prof2<>'c' and prof2<>'c++' and prof2<>'oracle' and prof2<>'dbase' ;

---54. Which Institute has most number of Students? 

CREATE TABLE InstStudNo (InstituteName VARCHAR(20), StdNo INT)

INSERT INTO InstStudNo
SELECT INSTITUTE,COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT InstituteName,StdNo AS COUNT_OF_STUDENTS FROM InstStudNo
WHERE StdNo = (SELECT MAX(StdNo) FROM InstStudNo)

select * from InstStudNo

--55. What is the Costliest course? 

SELECT COURSE, Fee
FROM STUDIES
WHERE fee = (SELECT MAX(fee) FROM STUDIES);

--56. Which course has been done by the most of the Students? 

CREATE TABLE CourStudNo (CourNam VARCHAR(20), StdNo INT)

INSERT INTO CourStudNo
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

select * from CourStudNo

SELECT CourNam,StdNo AS COUNT_OF_STUDENTS FROM CourStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM CourStudNo)


--57. Which Institute conducts costliest course. 

SELECT institute, COURSE FROM STUDIES WHERE fee = (SELECT MAX(fee) FROM STUDIES);

--58. Display the name of the Institute and Course, which has below AVG course fee.

select institute, course from studies where fee  < (SELECT AVG(fee) FROM STUDIES);

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 

SELECT COURSE FROM STUDIES WHERE fee < (SELECT AVG(fee)+1000 FROM STUDIES) AND fee > (SELECT AVG(fee)-1000 FROM STUDIES);

--60. Which package has the Highest Development cost? 

SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

--61. Which course has below AVG number of Students? 

CREATE TABLE AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO AVGCNT
SELECT COURSE, COUNT(PNAME) FROM studies GROUP BY COURSE
SELECT CRS,CNT FROM AVGCNT WHERE CNT <=(SELECT AVG(CNT) FROM AVGCNT)

--62. Which Package has the lowest selling cost? 

SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

--63. Who Developed the Package that has sold the least number of copies? 

SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

--64. Which language has used to develop the package, which has the highest sales amount? 

SELECT DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE);

--65. How many copies of package that has the least difference between development and selling cost where sold. 

SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));

--66. Which is the costliest package developed in PASCAL. 

SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST)FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL');

--67. Which language was used to develop the most number of Packages. 

SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN  HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM SOFTWARE);

--68. Which programmer has developed the highest number of Packages

SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING PNAME = (SELECT MAX(PNAME) FROM SOFTWARE);

--69. Who is the Author of the Costliest Package? 

SELECT PNAME, DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

--70. Display the names of the packages, which have sold less than the AVG number of copies. 

SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 

SELECT  distinct PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;

--72. Display the programmer Name and the cheapest packages developed by them in each language. 

SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN);

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 

SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

--74. Who is the youngest male Programmer born in 1965? 

SELECT pname, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As Age
from programmer where dob = (SELECT max(dob) from programmer where YEAR(dob)='1965' and GENDER='M');


--75. Who is the oldest Female Programmer who joined in 1992?

SELECT pname, 
case
when dateadd(year, datediff(YEAR, dob, getdate()), dob)>getdate()
then datediff(YEAR, dob, getdate()) - 1
else
datediff(YEAR, dob, getdate()) end As Age
from programmer where dob = (SELECT min(dob) from programmer where YEAR(doj)='1992' and GENDER='F');

--76. In which year was the most number of Programmers born. 

CREATE TABLE TEMP (YOB INT, CNT INT)

INSERT INTO TEMP
SELECT YEAR(DOB) AS YEAR ,COUNT(pname) FROM programmer GROUP BY YEAR(DOB)

SELECT * FROM TEMP

SELECT YOB, CNT FROM TEMP WHERE CNT= (SELECT MAX(CNT) FROM TEMP)

--77. In which month did most number of programmers join? 

CREATE TABLE MOJ (MOJ INT, CNT INT)

INSERT INTO MOJ
SELECT MONTH(DOJ),COUNT(pname) FROM programmer GROUP BY MONTH(DOJ)

SELECT MOJ, CNT FROM MOJ WHERE CNT= (SELECT MAX(CNT) FROM MOJ)


--78. In which language are most of the programmer’s proficient. 

CREATE TABLE PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO PCNT
SELECT PROF1, COUNT(pname) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(pname) FROM programmer GROUP BY PROF2

select * from PCNT

INSERT INTO PsCNT
SELECT PR, SUM(CNT) FROM PCNT GROUP BY PR

select * from PsCNT

SELECT PRs, sCNT FROM PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM PsCNT)

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 

SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'M'
AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER WHERE GENDER LIKE 'F');

--80. Who are the Female Programmers earning more than the Highest Paid? 

SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER WHERE GENDER = 'M');

--81. Which language has been stated as the proficiency by most of the Programmers? 

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)
union
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 = (SELECT MAX(PROF2) FROM PROGRAMMER);


--82. Display the details of those who are drawing the same salary. 

Select * From PROGRAMMER Where Salary in
(Select Salary From PROGRAMMER Group by Salary Having Count(Salary ) > 1);

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.

select * from programmer p,software s
where p.pname=s.pname and salary>3000 and gender='m';

--84. Display the details of the packages developed in Pascal by the Female Programmers. 

select s.* from programmer p,software s
where p.pname=s.pname and gender='f' and DEVELOPIN ='pascal';

--85. Display the details of the Programmers who joined before 1990. 

select * from programmer where year(doj)< 1990;

--86. Display the details of the Software Developed in C By female programmers of Pragathi. 

select s.* from software s,studies st,programmer p where s.pname=st.pname and p.pname=s.pname and gender='f' and institute='pragathi';

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.

Select studies.institute, count(software.developin) AS developin, count(software.sold) As Sold, sum(software.sold*software.scost) AS sales from software,studies
where software.pname =studies.pname group by studies.institute;

--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.

CREATE TABLE INST (INS VARCHAR(20), CNT INT)

INSERT INTO INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT distinct SW.* FROM software AS SW, programmer AS PG, studies AS ST, INST
WHERE DEVELOPIN='DBASE' AND GENDER='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM INST)


--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 

SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975))


--90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. 

select s.* from programmer p,software s
where s.pname=p.pname and (developin <> prof1 and developin <> prof2);

--91. Display the details of the software developed by the male students of Sabhari. 

select s.* from software s,studies st,programmer p where s.pname=st.pname and p.pname=s.pname and gender='m' and institute='Sabhari';

--92. Display the names of the programmers who have not developed any packages. 

select pname from programmer
where pname not in(select pname from software);

--93. What is the total cost of the Software developed by the programmers of Apple? 

select sum(scost) from software s,studies st
where s.pname=st.pname and institute='apple';

--94. Who are the programmers who joined on the same day? 

select a.pname,a.doj from programmer a,programmer b
where a.doj=b.doj and a.pname <> b.pname;

--95. Who are the programmers who have the same Prof2? 

select distinct(a.pname),a.prof2 from programmer a,programmer b
where a.prof2=b.prof2 and a.pname <> b.pname;

--96. Display the total sales value of the software, institute wise. 

select studies.institute,sum(software.sold*software.scost) from software,studies
where studies.pname=software.pname group by studies.institute;

--97. In which institute does the person who developed the costliest package studied.

select institute from software st,studies s
where s.pname=st.pname group by institute,dcost having dcost=(select max(dcost) from software);

--98. Which language listed in prof1, prof2 has not been used to develop any package. 

select prof1 from programmer where prof1 not in(select developin from software) 
union
select prof2 from programmer where prof2 not in(select developin from software);

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 

select p1.salary,s2.course from programmer p1,software s1,studies s2
where p1.pname=s1.pname and s1.pname=s2.pname and scost=(select max(scost) from software);

--100. What is the AVG salary for those whose software sales is more than 50,000/-. 

select avg(salary) from programmer p,software s
where p .pname=s.pname and sold*scost>50000;

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 

select s.pname, count(title) As packages from software s,studies st
where s.pname=st.pname group by s.pname,fee having min(fee)=(select min(fee) from studies);

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 

select count(developin) from programmer p,software s
where s .pname=p.pname group by developin having min(dcost)=(select min(dcost) from software);

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 

select count(developin) from programmer p,software s
where s.pname=p.pname and gender='f' and salary>(select max(salary) from programmer p,software s
where s.pname=p.pname and gender='m');

--104. How many packages are developed by the most experienced programmer form BDPS. 

select count(*) from software s,programmer p
where p.pname=s.pname group by doj having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

--105. List the programmers (form the software table) and the institutes they studied, including those WHO DIDN'T develop any package.

select pname,institute from studies
where pname not in(select pname from software);

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 

select count(*),sum(scost*sold-dcost) "PROFIT" from software
where developin in (select prof1 from programmer) group by developin;

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.

select s.pname,count(developin) from programmer p1,software s
where p1.pname=s.pname group by s.pname;