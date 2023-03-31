--1 Convierte las siguientes columnas a NOT NULLABLE 
--1.1
--TABLA: DISNEY_DIRECTOR
--COLUMNA NAME
ALTER TABLE DISNEY_DIRECTOR
ALTER COLUMN NAME SET NOT NULL;

--1.2
--TABLA: DISNEY_MOVIES_TOTAL_GROSS
--COLUMNA MOVIE_TITLE
ALTER TABLE DISNEY_MOVIE_TOTAL_GROSS
ALTER COLUMN MOVIE_TITLE SET NOT NULL;

--1.3
--TABLA: DISNEY_VOICE_ACTORS
--COLUMNAS: VOICE_ACTOR, CHARACTER
ALTER TABLE DISNEY_VOICE_ACTORS
ALTER COLUMN VOICE_ACTOR SET NOT NULL;
ALTER TABLE DISNEY_VOICE_ACTORS
ALTER COLUMN CHARACTER SET NOT NULL;

--1.4
--TABLA: DISNEY_CHARACTERS  
--COLUMNA : MOVIE_TITLE
ALTER TABLE DISNEY_CHARACTERS
ALTER COLUMN MOVIE_TITLE SET NOT NULL;


--2 Crea llaves primarias para las siguientes tablas 
--2.1 TABLA: DISNEY_DIRECTOR, Primary Key: NAME
ALTER TABLE DISNEY_DIRECTOR
ADD PRIMARY KEY (NAME);

--2.2 TABLA: DISNEY_MOVIES_TOTAL_GROSS, Primary Key: NAME
ALTER TABLE DISNEY_MOVIE_TOTAL_GROSS
ADD PRIMARY KEY (MOVIE_TITLE);
---------------------------------------------------

--2.3 TABLA: DISNEY_VOICE_ACTORS, Primary Key: VOICE_ACTOR
ALTER TABLE DISNEY_VOICE_ACTORS
ADD PRIMARY KEY (VOICE_ACTOR);
-----------------------------------------------------------

--2.4 TABLA: DISNEY_CHARACTERS, Primary Key: MOVIE_TITLE
ALTER TABLE DISNEY_CHARACTERS
ADD PRIMARY KEY (MOVIE_TITLE);


--3 Modifica la llave primaria de la tabla DISNEY_DIRECTOR. para que ahora tenga como campo llave las dos columnas NAME, DIRECTOR
ALTER TABLE DISNEY_DIRECTOR
DROP PRIMARY KEY;
ALTER TABLE DISNEY_DIRECTOR
ALTER COLUMN DIRECTOR SET NOT NULL;
ALTER TABLE DISNEY_DIRECTOR
ADD PRIMARY KEY (NAME, DIRECTOR);



--4 Crea una nueva columna en la tabla DISNEY_MOVIES_TOTAL_GROSS
--TABLA: DISNEY_MOVIES_TOTAL_GROSS
--NUEVA COLUMNA: RELEASECOUNTRY
--TIPO VARCHAR, DE 10
--QUE NO ACEPTE NULOS, Y SU VALOR POR DEFECTO SEA "NOT DEFINED"
ALTER TABLE DISNEY_MOVIE_TOTAL_GROSS
ADD COLUMN RELEASECOUNTRY VARCHAR(11) 
NOT NULL DEFAULT 'NOT DEFINED';
--------------------------------------------pero si pudi


--5 Crea una vista,  que muestre las Columnas: nombre de la pelicula, heroe, villano, y nombre del director, que cumple con la condicion donde ambas columnas  HERO y el Villano tienen un valor valido (diferente de nulo) y el director es Ron Clements
--Nombre de la Vista: v_MoviesDirectedbyRonClements
CREATE VIEW v_MoviesDirectedbyRonClements AS
SELECT DC.MOVIE_TITLE, DC.HERO, DC.VILLIAN, DD.DIRECTOR
FROM DISNEY_CHARACTERS DC 
JOIN DISNEY_DIRECTOR DD ON DC.MOVIE_TITLE = DD.NAME
WHERE DC.HERO IS NOT NULL AND DC.VILLIAN IS NOT NULL
AND DD.DIRECTOR = 'Ron Clements';


--6 Crea una vista,  que muestre nombre de la pelicula, nombre del personaje(character), voice_actor, para todos los villanos  donde el valor del campo voice_actor empieze con "J"
--Nombre de la Vista: v_MoviesDVillianJ
CREATE VIEW v_MoviesDVillianJ AS
SELECT DC.MOVIE_TITLE, DVA.CHARACTER, DVA.VOICE_ACTOR 
FROM DISNEY_CHARACTERS DC
JOIN DISNEY_VOICE_ACTORS DVA
ON DC.VILLIAN = DVA.CHARACTER
WHERE DVA.VOICE_ACTOR LIKE 'J%';


--7 Crea una consulta en la tabla SysCat que muestre todas las tablas que lleven en su nombre la palabra 'DISNEY'
SELECT * FROM SYSIBM.SYSTABLES
WHERE NAME LIKE '%DISNEY%';


--8 Crea una consulta en la tabla SysCat que muestre todas las columnas  de tipo VARCHAR ,  y que el nombre de la tabla que lleven en su nombre la palabra 'DISNEY'
SELECT * FROM SYSIBM.SYSCOLUMNS
WHERE ColType = 'VARCHAR' AND TBName LIKE '%DISNEY%';