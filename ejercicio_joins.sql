--1.2
SELECT D.DEPTNO ,D.DEPTNAME 
,P.PROJNO ,P.PROJNAME ,
E.EMPNO ,E.FIRSTNME ,E.LASTNAME ,E.JOB
FROM DEPARTMENT D
JOIN PROJECT P ON D.DEPTNO =P.DEPTNO
JOIN EMPLOYEE  E ON E.WORKDEPT =D.DEPTNO;

--2.2
SELECT d.deptno, d.mgrno, d.admrdept,
p.projno, p.projname,
e.empno, e.firstnme, e.lastname, e.job
FROM DEPARTMENT d
JOIN EMPLOYEE e ON e.workdept = d.DEPTNO
JOIN PROJECT p ON d.DEPTNO = p.DEPTNO
WHERE e.JOB = 'DESIGNER';

--3.1
SELECT e.empno, e.firstnme, e.lastname, e.salary,
ep.empno, ep.actno,
a.actkwd, a.actdesc
FROM employee e
JOIN EMPPROJACT ep ON e.empno = ep.empno
JOIN act a ON a.actno = ep.actno;

--4.2
SELECT e.empno, e.firstnme, e.lastname, e.salary,
ep.empno, ep.actno,
a.actkwd, a.actdesc
FROM employee e
JOIN EMPPROJACT ep ON e.empno = ep.empno
JOIN act a ON a.actno = ep.actno
where e.sex = 'M';

--5.2
SELECT D.deptname,
E.firstnme, E.lastname
FROM DEPARTMENT D
JOIN EMPLOYEE E ON E.WORKDEPT = D.DEPTNO
JOIN EMP_PHOTO EP ON EP.EMPNO = E.EMPNO
WHERE EP.PHOTO_FORMAT IS NOT NULL;

--5.3
select a.actkwd, a.actdesc,
p.acstdate
from act A
join empprojact ep on a.actno = ep.actno
join projact p on p.projno = ep.projno
JOIN project pr ON p.PROJNO = pr.PROJNO 
where pr.PROJNAME = 'PAYROLL PROGRAMMING';

--5.4
select a.actkwd, a.actdesc,
ep.projno, ep.EMPNO
from act a
join empprojact ep on a.actno = ep.actno
join employee e on e.empno = ep.empno
where e.sex = 'F';

--6.2
select d.deptname,
e.firstnme, lastname
from department d
join employee e on d.deptno = e.workdept
join EMP_RESUME er on er.empno = e.empno
join emp_photo ep on ep.empno = e.empno
where ep.photo_format is not null
and er.resume_format = 'html';

--6.3
select a.actkwd, a.actdesc,
ep.projno, ep.empno,
d.deptname
from act a
join empprojact ep on a.actno = ep.actno
join employee e on e.empno = ep.empno
join department d on d.deptno = e.workdept
where e.sex = 'F';

--6.4
select a.actkwd, a.actdesc,
p.acstdate,
ep.emstdate,
e.firstnme, e.lastname,
pr.projname
from act A
join empprojact ep on a.actno = ep.actno
join projact p on p.projno = ep.projno
JOIN project pr ON p.PROJNO = pr.PROJNO
join employee e on e.empno = ep.empno
where pr.PROJNAME = 'PAYROLL PROGRAMMING';




--A revisar
--1.2  12pts
SELECT d.DEPTNO, d.MGRNO, d.ADMRDEPT, p.PROJNO, p.PROJNAME, e.EMPNO, e.FIRSTNME, e.LASTNAME, e.JOB
FROM DEPARTMENT d
JOIN PROJECT p ON d.DEPTNO = p.DEPTNO
JOIN EMPLOYEE e ON d.DEPTNO = e.WORKDEPT;


--2.2 12pts
SELECT d.DEPTNO, d.MGRNO, d.ADMRDEPT, p.PROJNO, p.PROJNAME, e.EMPNO, e.FIRSTNME, e.LASTNAME, e.JOB
FROM DEPARTMENT d
JOIN PROJECT p ON d.DEPTNO = p.DEPTNO
JOIN EMPLOYEE e ON d.DEPTNO = e.WORKDEPT
WHERE e.JOB = 'DESIGNER'; 


--3.1 6pts
SELECT e.EMPNO, e.FIRSTNME, e.LASTNAME, e.SALARY,
ea.EMPNO, ea.ACTNO,
a.ACTKWD, a.ACTDESC
FROM EMPLOYEE e
JOIN EMPPROJACT ea ON ea.EMPNO = e.EMPNO
JOIN ACT a ON a.ACTNO = e.EMPNO;


--4.2 6pts
SELECT e.EMPNO, e.FIRSTNME, e.LASTNAME, e.SALARY,
ea.EMPNO, ea.ACTNO,
a.ACTKWD, a.ACTDESC
FROM EMPLOYEE e
JOIN EMPPROJACT ea ON ea.EMPNO = e.EMPNO
JOIN ACT a ON a.ACTNO = e.EMPNO
WHERE e.SEX = 'M';


--5.2 12pts
SELECT d.DEPTNAME, e.FIRSTNME, e.LASTNAME
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON d.DEPTNO = e.WORKDEPT
JOIN EMP_PHOTO ep ON ep.EMPNO = e.EMPNO 
WHERE ep.PICTURE IS NOT NULL;


--5.3 12pts
SELECT a.ACTKWD, a.ACTDESC, pr.ACSTDATE 
FROM ACT a 
JOIN PROJACT pr ON pr.ACTNO = a.ACTNO 
JOIN PROJECT p ON p.PROJNO = pr.PROJNO 
WHERE  p.PROJNAME = 'PAYROLL PROGRAMMING';


--5.4 6pts
SELECT a.ACTKWD, a.ACTDESC, p.PROJNO, e.EMPNO 
FROM ACT a 
JOIN PROJECT p ON p.RESPEMP = a.ACTNO 
JOIN EMPLOYEE e ON e.WORKDEPT = p.DEPTNO 
WHERE e.SEX = 'F';


--6.2 6pts
SELECT a.ACTKWD, a.ACTDESC, e.FIRSTNME, e.LASTNAME 
FROM ACT a 
JOIN EMPLOYEE e ON e.WORKDEPT = a.ACTNO 
JOIN EMP_PHOTO ep ON ep.EMPNO = e.EMPNO 
WHERE ep.PICTURE IS NOT NULL;


--6.3 6pts
SELECT a.ACTKWD, a.ACTDESC, p.PROJNO, e.EMPNO, d.DEPTNAME 
FROM ACT a 
JOIN PROJECT p ON p.RESPEMP = a.ACTNO 
JOIN EMPLOYEE e ON e.WORKDEPT = p.DEPTNO 
JOIN DEPARTMENT d ON d.DEPTNO = e.WORKDEPT
WHERE e.SEX = 'F';


--6.4 0pts

--total 78/100
