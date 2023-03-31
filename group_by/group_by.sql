--Find the avarage salary of people in each department

SELECT WORKDEPT, DECIMAL (AVG(SALARY),5,0)
       FROM EMPLOYEE
       GROUP BY WORKDEPT;


--For example, suppose that you want a list of the number of people working on each major  project described in the CORPDATA PROJECT table. You can issue:

SELECT SUM(PRSTAFF) , MAJPROJ
       FROM PROJECT
       GROUP BY MAJPROJ;


--For example, you can issue a select statement to find the average salary for men and women in each department, using the CORPDATA EMPLOYEE table. To do this, you can issue:

SELECT WORKDEPT, SEX, 
DECIMAL(AVG(SALARY),5,0) AS AVG_WAGES
       FROM EMPLOYEE
       GROUP BY WORKDEPT, SEX;




--1. Crea un reporte que muestra la cantidad de empleados de cada  genero(sex)
SELECT COUNT(*), sex FROM employee group by sex;


--2.	Crea un reporte con el año de nacimiento(birthday) de los empleados y la cantidad de personas con el mismo año de nacimiento.
select count(*), year(birthdate) FROM employee group by year(birthdate);


--3. Crea un reporte con el año de contratacion(hiredate) de los empleados y la cantidad de personas con el mismo año de contratacion.
select count(*), year(hiredate) FROM employee group by year(hiredate);


--4.	Cuál es el sueldo promedio de los empleados deacuerdo a su nivel de educacion(edlevel)}
select avg(salary), edlevel from employee group by edlevel;


--5. Cuantos empleados hay asignamos a cada projecto(projno)
select count(*), projno from EMPPROJACT GROUP BY projno;


--6.	Cual es el sueldo maximo y sueldo minimo de los empleados segun su trabajo(job)
select job, max(salary) "MAX", min(salary) "MIN" from employee group by job;
