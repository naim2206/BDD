--1 Find the average salary of people in each department, show department name Table: EMPLOYEE, DEPARTMENT
SELECT WORKDEPT,d.DEPTNAME, DECIMAL 
(AVG(SALARY),5,0)
       FROM EMPLOYEE e JOIN DEPARTMENT d ON 
e.WORKDEPT =d.DEPTNO 
       GROUP BY WORKDEPT,d.DEPTNAME;

--2 Find the average salary of people in each department, show only department name starting with "D" Table: EMPLOYEE, DEPARTMENT
SELECT WORKDEPT,d.DEPTNAME, DECIMAL 
(AVG(SALARY),5,0)
       FROM EMPLOYEE e JOIN DEPARTMENT d ON 
e.WORKDEPT =d.DEPTNO 
       WHERE WORKDEPT LIKE 'D%'
       GROUP BY WORKDEPT,d.DEPTNAME;

--3 Find the average salary of people in each department, show only data where average salary is higher than 50000 usd. Table: EMPLOYEE, DEPARTMENT
SELECT WORKDEPT,d.DEPTNAME, DECIMAL 
(AVG(SALARY),5,0)
       FROM EMPLOYEE e JOIN DEPARTMENT d 
ON e.WORKDEPT =d.DEPTNO 
       GROUP BY WORKDEPT,d.DEPTNAME
 having AVG(SALARY) >50000;




 --ejercicios
--1 Crea un reporte que muestra la cantidad de empleados de cada genero(sex) para los empleados que tienen empleo de "CLERK"
select sex, count(*) from employee where job = 'CLERK' group by sex;


--2 Crea un reporte con el año de nacimiento(birthday) de  los empleados y la cantidad de personas con el mismo año de nacimiento, Solo cuando el año de nacimiento sea de 40 años atras de la fecha actual.
select year(birthdate), count(*) from employee where year(birthdate) < year(current timestamp)-40 group by year(birthdate);


--3 Crea un reporte con el año de nacimiento(birthday) de los empleados y la cantidad de personas con el mismo año de nacimiento, despliga solo los años de nacimiento con 3 o mas personas en cada año..
select year(birthdate), count(*) from employee group by year(birthdate) having count(*) >= 3;


--4 Cuantos empleados hay asignamos a cada projecto(projno), muestra tambien el nombre del proyecto, muestra solo los projectos que su projno inicia con "M" y que tengan a mas de 3 empleados trabajando en los correspondientes proyectos
SELECT epa.PROJNO,p.PROJNAME ,count(EMPNO) "Qty Employees"
FROM empprojact epa JOIN PROJECT p ON p.PROJNO =epa.PROJNO
WHERE epa.PROJNO LIKE 'M%'
GROUP BY epa.PROJNO,p.PROJNAME
HAVING count(EMPNO)>3 ;


--5 Lista los empleados el nombre del puesto/job MANAGER , FIELDREP,PRES,OPERATOR;   la cantidad total de empleados en ese puesto,el sueldo maximo y sueldo minimo de los empleados segun su trabajo(job)
select job, count(*), max(salary), min(salary) from employee
where job in ('MANAGER', 'FIELDREP', 'PRES') group by job;


--6 Lista los empleados el nombre del puesto/job MANAGER , FIELDREP,PRES;   la cantidad total de empleados en ese puesto,el sueldo maximo y sueldo minimo de los empleados segun su trabajo(job)  y incluye solo todos los datos que tengan como sueldo minimo apartir de 50000 usd
SELECT JOB, COUNT(1) "QTY Employees",MAX(SALARY) "MAX SALARY", MIN(SALARY) "MIN SALARY" FROM EMPLOYEE 
WHERE JOB IN ('MANAGER' ,'FIELDREP','PRES')
GROUP BY JOB
HAVING MIN(SALARY)>50000;