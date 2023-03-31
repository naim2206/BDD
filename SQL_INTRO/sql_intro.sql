--seleccion - extraccion
--SELECT 
--seleccona todas las columnas
SELECT
    *
FROM
    DEPARTMENT;


--seleccionaalgunas columnas de una tabla
SELECT
    DEPNO,
    DEPTNAME
FROM
    DEPARTMENT d;


--selecciona todas las columnas de EMPLOYEE
SELECT
    *
FROM
    EMPLOYEE;


--Selecciona solo 5 columnas de la tabla EMPLOYEE, asegurate de incluir el numero de empleado y el apellido.
SELECT
    EMPNO,
    LASTNAME,
    firstnme,
    midinit,
    workdept
FROM
    employee;


--WHERE
--Selecciona toda la informacion de todos los departamentos que tengan el admrdept=E01 
SELECT
    *
FROM
    DEPARTMENT
WHERE
    admrdept = 'E01'
    AND (
        location = 'ITESO'
        OR location IS NULL
    );


-- sepuede usar AND y OR
--Selecciona toda la información de todos los empleados que tengan el job=MANAGER 
SELECT
    *
FROM
    EMPLOYEE
WHERE
    job = 'MANAGER';


--Selecciona toda la información de todos los empleados que tengan el SEX=M
SELECT
    *
FROM
    EMPLOYEE
WHERE
    SEX = 'M';


--Selecciona toda la información de todos los empleados que tengan el MidInit=J
SELECT
    *
FROM
    EMPLOYEE
WHERE
    midinit = 'J';


--Selecciona toda la información de todos los empleados que tengan no tengan nada en MidInit
SELECT
    *
FROM
    EMPLOYEE
WHERE
    MidInit IS NULL;


--DISTINCT: No repetidos
SELECT
    DISTINCT WORKDEPT
FROM
    EMPLOYEE;


--LIMIT: limitar cantidad de resultados
SELECT
    WORKDEPT
FROM
    EMPLOYEE
LIMIT
    5;


--Inicio y cantidad de resultados en limit
SELECT
    WORKDEPT
FROM
    EMPLOYEE
LIMIT
    4, 12;


--Fully qualified name
SELECT
    EMPLOYEE.WORKDEPT
FROM
    EMPLOYEE;


--ORDER: used with SELECT to sort the data
--DESC para que sea descendente
SELECT
    *
FROM
    EMPLOYEE
ORDER BY
    FIRSTNME;


--Se puede ordenar por mas de una columna
SELECT
    *
FROM
    EMPLOYEE
ORDER BY
    FIRSTNME,
    MidInit;


--Selecciona solo 5 columnas de la tabla EMPLOYEE, asegurate de incluir el numero de empleado y el apellido Y ordena por el campo LASTNAME
SELECT
    EMPNO,
    LASTNAME,
    firstnme,
    midinit,
    workdept
FROM
    employee
ORDER BY
    LASTNAME;


--Selecciona todas las columnas de la tabla EMPLOYEE, Y ordena por el campo birthday empezando por las fechas mas antiguas
SELECT
    *
FROM
    EMPLOYEE
ORDER BY
    birthdate DESC;


--WHERE: extract only those records that fulfill a specified criterion.
SELECT
    *
FROM
    EMPLOYEE
WHERE
    MIDINIT = 'I';


--BETWEEN: selects values within a range. The first value must be lower bound and the second value, the upper bound.
SELECT
    *
FROM
    EMPLOYEE
WHERE
    EMPNO BETWEEN 1
    AND 100;


/*
 LOGICAL OPERATORS
 AND: TRUE if both are TRUE
 OR: TRUE if either is TRUE
 IN: TRUE if operand is equal to one in a list of expresions
 NOT: TRUE if not true
 */
--IN:
SELECT
    *
FROM
    EMPLOYEE
WHERE
    PHONENO IN (3978, 3476);


--NOT:
SELECT
    *
FROM
    EMPLOYEE
WHERE
    PHONENO NOT IN (3978, 3476);


--CONCAT: concatenate two or more text values and returns the concatenating string.
SELECT
    CONCAT(FIRSTNME, ', ', LASTNAME) AS NOMBRE
FROM
    EMPLOYEE;


--Arithmetic Operators
SELECT
    FIRSTNME,
    SALARY,
    SALARY * 2 AS DOUBLE_SALARY
FROM
    EMPLOYEE;


--UPPER and LOWER: converts all letters in the specified string to uppercase or lowercase
SELECT
    UPPER(FIRSTNME) AS FIRST_NAME,
    LOWER(LASTNAME) AS LAST_NAME
FROM
    EMPLOYEE;


--SQRT: returns the square root of given value in the argument.
SELECT
    SALARY,
    SQRT(SALARY)
FROM
    EMPLOYEE;


--AVG: returns the average value of a numeric column
SELECT
    AVG(SALARY)
FROM
    EMPLOYEE;


--SUM: calculate the sum for a column's values.
SELECT
    SUM(SALARY)
FROM
    EMPLOYEE;


--Combinar queries (subqueries)
SELECT
    FIRSTNME,
    SALARY
FROM
    EMPLOYEE
WHERE
    SALARY < (
        SELECT
            AVG(SALARY)
        FROM
            EMPLOYEE
    )
ORDER BY
    SALARY DESC;


--LIKE: specify a search condition within your WHERE clause.
SELECT
    FIRSTNME
FROM
    EMPLOYEE
WHERE
    FIRSTNME LIKE 'C%';


--MIN: return the minimum value of an expression in a SELECT statement.
SELECT
    MIN(SALARY) AS SALARY
FROM
    EMPLOYEE;


--JOIN: juntar info de dos tablas
SELECT
    t.TITULO,
    t.IDCLASIFICACION,
    c.IDCLASIFICACION,
    c.CLASIFICACION
FROM
    TITULO t,
    CLASIFICACION c
WHERE
    t.IDCLASIFICACION = c.IDCLASIFICACION;


--INNER JOIN: It returns rows when there is a match between the tables.
SELECT
    t.TITULO,
    t.IDCLASIFICACION,
    c.IDCLASIFICACION,
    c.CLASIFICACION
FROM
    TITULO t
    INNER JOIN CLASIFICACION c ON t.IDCLASIFICACION = c.IDCLASIFICACION;


--LEFT JOIN: returns all rows from the left table, even if there are no matches in the right table.
SELECT
    t.TITULO,
    t.IDCLASIFICACION,
    c.IDCLASIFICACION,
    c.CLASIFICACION
FROM
    TITULO t
    LEFT OUTER JOIN CLASIFICACION c ON t.IDCLASIFICACION = c.IDCLASIFICACION;


--RIGHT JOIN, igual pero right.
--UNION combines multiple datasets into a single dataset, and removes any existing duplicates.
--UNION ALL combines multiple datasets into one dataset, but does not remove duplicate rows.
SELECT
    FirstName,
    LastName,
    Company
FROM
    businessContacts
UNION
SELECT
    FirstName,
    LastName,
    NULL
FROM
    otherContacts;


--INSERT INTO: add new rows of data to a table in the database.
INSERT INTO
    EMPLOYEE VALUE (8, 'ANTHONY', 'YOUNG', 35);


INSERT INTO
    EMPLOYEE (ID, FirstName, LastName, Age) VALUE (8, 'ANTHONY', 'YOUNG', 35);


--UPDATE: allows us to alter data in the table.
UPDATE
    EMPLOYEE
SET
    SALARY = 5000
WHERE
    ID = 1;


--DELETE: remove data from your table. DELETE queries
DELETE FROM
    EMPLOYEE
WHERE
    ID = 1;


--CREATE TABLE: Create a new table
CREATE TABLE Users (
    UserID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    City VARCHAR(100),
    PRIMARY KEY (UserID)
);


/*Numeric
 INT -A normal-sized integer that can be signed or unsigned.
 FLOAT(M,D) - A floating-point number that cannot be unsigned. You can optionally define the display length (M) and the number of decimals (D).
 DOUBLE(M,D) - A double precision floating-point number that cannot be unsigned. You can optionally define the display length (M) and the number of decimals (D).
 
 Date and Time
 DATE - A date in YYYY-MM-DD format.
 DATETIME - A date and time combination in YYYY-MM-DD HH:MM:SS format.
 TIMESTAMP - A timestamp, calculated from midnight, January 1, 1970
 TIME - Stores the time in HH:MM:SS format.
 
 String Type
 CHAR(M) - Fixed-length character string. Size is specified in parenthesis. Max 255 bytes.
 VARCHAR(M) - Variable-length character string. Max size is specified in parenthesis.
 BLOB - "Binary Large Objects" and are used to store large amounts of binary data, such as images or other types of files.
 TEXT - Large amount of text data.
 
 NOT NULL - Indicates that a column cannot contain any NULL value.
 UNIQUE - Does not allow to insert a duplicate value in a column. The UNIQUE constraint maintains the uniqueness of a column in a table. More than one UNIQUE column can be used in a table.
 PRIMARY KEY - Enforces the table to accept unique data for a specific column and this constraint create a unique index for accessing the table faster.
 CHECK - Determines whether the value is valid or not from a logical expression.
 DEFAULT - While inserting data into a table, if no value is supplied to a column, then the column gets the value set as DEFAULT.*/
--.
--.
--ALTER TABLE: add, delete, or modify columns in an existing table.
ALTER TABLE
    People
ADD
    DateOfBirth DATE;


--Delete: DROP
ALTER TABLE
    People DROP DateOfBirth;


DROP TABLE People;


--RENAME
ALTER TABLE
    People RENAME FirstName TO name;


RENAME TABLE People TO Users;


--VIEW: virtual table that is based on the result-set of an SQL statement.
CREATE VIEW ​ List AS
SELECT
    FirstName,
    Salary
FROM
    Employee;


SELECT
    *
FROM
    List;


--CREATE OR REPLACE VIEW:
CREATE
OR REPLACE VIEW List AS
SELECT
    FirstName,
    LastName,
    Salary
FROM
    Employee;


--Delete view: DROP VIEW
DROP VIEW List;


--ejercicios
INSERT INTO
    Animals (name, TYPE, country_id)
VALUES
    ('Slim', 'Giraffe', 1);


SELECT
    a.name,
    a.type,
    c.country
FROM
    animals a,
    countries c
WHERE
    a.country_id = c.id
ORDER BY
    c.country;


--FUNCIONES: aggregate functions
--AVG, COUNT, MAX, MIN, SUM, RANGE, STDEV, VARIANCE
--Cuántos registros tiene en total la EMPLOYEE
SELECT
    COUNT(*)
FROM
    EMPLOYEE;


--cuál es la fecha de cumpleaños(BIRTHDATE) mas reciente
SELECT
    MIN(birthdate)
FROM
    employee;


--cuál es la fecha de cumpleaños(BIRTHDATE) mas antigua
SELECT
    MAX(birthdate)
FROM
    employee;


--cuál es la comisión(COMM) mas alta en los empleados con puesto (JOB) de DESIGNER 
SELECT
    MAX(COMM)
FROM
    EMPLOYEE
WHERE
    JOB = 'DESIGNER';


--cuál es la comisión(COMM) mas alta en los empleados con puesto (JOB) de DESIGNER Y de SEXO(sex)=M
SELECT
    MAX(COMM)
FROM
    EMPLOYEE
WHERE
    JOB = 'DESIGNER'
    AND SEX = 'M';


--cuál es la comisión promedio de los empleados
SELECT
    AVG(COMM)
FROM
    EMPLOYEE;