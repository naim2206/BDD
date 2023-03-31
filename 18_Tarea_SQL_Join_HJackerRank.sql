SELECT * FROM DISNEY_MOVIE_TOTAL_GROSS dmtg ;
SELECT * FROM DISNEY_DIRECTOR dd ;
SELECT * FROM DISNEY_CHARACTERS dc ;
SELECT * FROM DISNEY_VOICE_ACTORS dva ;


SELECT dc.hero, dc.movie_title FROM DISNEY_CHARACTERS dc JOIN DISNEY_MOVIE_TOTAL_GROSS dmtg ON dc.MOVIE_TITLE = dmtg.MOVIE_TITLE WHERE dmtg.genre = 'Musical';

SELECT dc.hero, dc.movie_title, dmtg.genre FROM DISNEY_MOVIE_TOTAL_GROSS dmtg JOIN DISNEY_CHARACTERS dc ON dc.MOVIE_TITLE = dmtg.MOVIE_TITLE WHERE dmtg.genre = 'Adventure' OR dmtg.genre = 'Musical' ORDER BY dmtg.genre;


SELECT dc.villian, dc.movie_title, dmtg.genre FROM DISNEY_CHARACTERS dc JOIN DISNEY_MOVIE_TOTAL_GROSS dmtg ON dc.MOVIE_TITLE = dmtg.MOVIE_TITLE WHERE dmtg.genre = 'Musical' ORDER BY dc.villian;

SELECT dc.movie_title, dc.hero, dc.song, dd.director FROM DISNEY_DIRECTOR dd JOIN DISNEY_CHARACTERS dc ON dc.MOVIE_TITLE = dd.NAME WHERE dc.hero = 'Donald Duck';


SELECT dc.movie_title, dc.hero, dc.song, dd.director FROM DISNEY_DIRECTOR dd JOIN DISNEY_CHARACTERS dc ON dc.MOVIE_TITLE = dd.NAME WHERE dc.hero = 'Donald Duck' AND dc.song IS NOT NULL;

SELECT dc.movie_title, dc.hero, dc.villian, dd.director FROM DISNEY_DIRECTOR dd JOIN DISNEY_CHARACTERS dc ON dc.MOVIE_TITLE = dd.NAME WHERE dc.hero IS NOT NULL AND dc.villian IS NOT NULL;

SELECT dc.movie_title, dc.hero, dc.villian, dd.director FROM DISNEY_DIRECTOR dd JOIN DISNEY_CHARACTERS dc ON dc.MOVIE_TITLE = dd.NAME WHERE dc.hero IS NOT NULL AND dc.villian IS NOT NULL AND dd.director = 'Ben Sharpsteen';