SELECT * FROM DISNEY_MOVIE_TOTAL_GROSS dmtg
JOIN DISNEY_CHARACTERS dc ON dmtg.MOVIE_TITLE = dc.MOVIE_TITLE;


--2 Lista todos los Héroes , títulos de películas y genero, de genero de Musical y Adventure, ordénalos por el genero
SELECT dc.HERO, dc.MOVIE_TITLE, dmtg.GENRE FROM DISNEY_MOVIE_TOTAL_GROSS dmtg
JOIN DISNEY_CHARACTERS dc ON dmtg.MOVIE_TITLE =dc.MOVIE_TITLE WHERE dmtg.GENRE = 'Musical' OR dmtg.GENRE = 'Adventure' ORDER BY dmtg.GENRE;
