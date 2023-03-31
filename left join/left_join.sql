--2.1 Lista el nombre de los villanos(DISNEY_CHARACTERS), la pelicula en donde aparecen y su correspondiente nombre de director.
SELECT DC.VILLIAN, DC.MOVIE_TITLE, DD.DIRECTOR FROM DISNEY_CHARACTERS DC LEFT JOIN DISNEY_DIRECTOR DD ON DC.MOVIE_TITLE= DD.NAME;

--2.2 Si, NO hay villanos para la pelicula correspondiente de DISNEY_CHARACTERS, NO muestres ese registro
SELECT DC.VILLIAN, DC.MOVIE_TITLE, DD.DIRECTOR FROM DISNEY_CHARACTERS DC LEFT JOIN DISNEY_DIRECTOR DD ON DC.MOVIE_TITLE= DD.NAME where DC.VILLIAN is not null;

--2.3 Si el director no existe, (is null), entonces muestra el texto "Not Available" en la columna de Director
SELECT DC.VILLIAN, DC.MOVIE_TITLE, isnull(DD.DIRECTOR, 'Not Available') "Director" FROM DISNEY_CHARACTERS DC LEFT JOIN DISNEY_DIRECTOR DD ON DC.MOVIE_TITLE= DD.NAME where DC.VILLIAN is not null;

--2.4  Lista el nombre de las peliculas disponibles, release_date, hero, villian, song de la tabla  DISNEY_CHARACTERS, y  que no tienen director(DISNEY_DIRECTOR)
SELECT DC.VILLIAN, DC.MOVIE_TITLE, dc.song, dc.release_date FROM DISNEY_CHARACTERS DC LEFT JOIN DISNEY_DIRECTOR DD ON DC.MOVIE_TITLE= DD.NAME
where dd.director is null;

--2.5. Lista el nombre de las peliculas disponibles (DISNEY_DIRECTOR) Y que no tienen una pelicula correspondiente en DISNEY_MOVIES_TOTAL_GROSS
SELECT DD.NAME, DD.DIRECTOR FROM DISNEY_DIRECTOR DD WHERE DD.NAME
NOT IN (SELECT DMTG.MOVIE_TITLE FROM DISNEY_MOVIES_TOTAL_GROSS DMTG);

--3.1 Muestra el TITULO, GENERO Y RELEASE DATE de todas las peliculas(DISNEY_MOVIES_TOTAL_GROSS) y el nombre de su cancion (DISNEY_CHARACTERS), si no hay cancion escribe "no song available"
SELECT DMTG.MOVIE_TITLE, DMTG.GENRE, DMTG.RELEASE_DATE, ISNULL (DC.SONG, 'NO SONG AVAILABLE') "SONG"
FROM DISNEY_MOVIES_TOTAL_GROSS DMTG LEFT JOIN DISNEY_CHARACTERS DC ON DMTG.MOVIE_TITLE= DC.MOVIE_TITLE;


--3.2) Cuantas peliculas hay en DISNEY_MOVIES_TOTAL_GROSS?
SELECT DISTINCT count(*) FROM DISNEY_MOVIES_TOTAL_GROSS dmtg;

--3.3) Cuantas peliculas hay en DISNEY_CHARACTERS?
SELECT DISTINCT count(*) FROM DISNEY_CHARACTERS dc;

--3.4) Cuantas peliculas de DISNEY_MOVIES_TOTAL_GROSS no tienen un registro correspondiente en DISNEY_CHARACTERS?
SELECT COUNT(DMTG.MOVIE_TITLE) FROM DISNEY_MOVIES_TOTAL_GROSS DMTG
WHERE DMTG.MOVIE_TITLE NOT IN (SELECT DC.MOVIE_TITLE FROM DISNEY_CHARACTERS DC);

--3.5 Muestra el titulo de la película, un personaje heroe, el genero y donde no haya genero disponible escribir "not available", y la columna MPAA_RATING
SELECT DC.MOVIE_TITLE, DC.HERO, ISNULL (DMTG.GENRE, 'NOT AVAILABLE') "GENRE", DMTG.MPAA_RATING
FROM DISNEY_CHARACTERS DC LEFT JOIN DISNEY_MOVIES_TOTAL_GROSS DMTG ON DMTG.MOVIE_TITLE= DC.MOVIE_TITLE;

--3.6 Muestra el titulo de la película, un personaje, el genero y donde no haya genero disponible escribir "not available", agrega una columna "MPAA_RATING Description" que muestre lo siguiente, 
--Si la columna MPAA_RATING contiene el valor de abajo, debe mostrar el valor que esta después del guion.
--  G – General Audiences
--  PG – Parental Guidance Suggested
--  PG-13 - Parents Strongly Cautioned
--  R - Restricted
--  Not Rated
SELECT DMTG.MOVIE_TITLE, DC.HERO, ISNULL(DMTG.GENRE, 'Not Available') "GENRE",
CASE
WHEN DMTG.MPAA_RATING= 'G' THEN 'General Audiences'
WHEN DMTG.MPAA_RATING= 'PG' THEN 'Parental Guidance Suggested'
WHEN DMTG.MPAA_RATING= 'PG-13' THEN 'Parents Strongly Cautioned'
WHEN DMTG.MPAA_RATING= 'R' THEN 'Restricted'
ELSE 'Not Rated'
END AS "MPAA_RATING DESCRIPTION" FROM DISNEY_MOVIE_TOTAL_GROSS DMTG
LEFT JOIN DISNEY_CHARACTERS DC ON DMTG.MOVIE_TITLE= DC.MOVIE_TITLE;