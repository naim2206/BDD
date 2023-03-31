
-- ejemplo
drop PRODECURE SP_GETAMTDIRECTORS;

CREATE PROCEDURE SP_GETAMTDIRECTORS (OUT P_ROWS INT)
    RESULT SETS 1
    LANGUAGE SQL
    BEGIN
    SET P_ROWS = (SELECT COUNT(*) FROM DISNEY_DIRECTOR);
RETURN P_ROWS;
    END;

CALL SP_GETAMTDIRECTORS(?);


-- ejercicio
DROP PROCEDURE SP_GETAMTSongs;

CREATE PROCEDURE SP_GETAMTSongs (OUT P_ROWS INT)
    RESULT SETS 1
    LANGUAGE SQL
    BEGIN
    SET P_ROWS = (SELECT COUNT(*) FROM DISNEY_CHARACTERS dc WHERE song is not null);
    RETURN p_ROWS;
    END;

CALL SP_GETAMTSongs(?);



-- ejemplo
DROP PROCEDURE SP_ADDDISNEY_DIRECTOR;

CREATE PROCEDURE SP_ADDDISNEY_DIRECTOR (IN P_MOVIE_TITLE VARCHAR(100), P_DIRNAME VARCHAR(100), OUT P_STATUS INT)
    RESULT SETS 1
    LANGUAGE SQL
    BEGIN
        SET P_STATUS = 1;
        INSERT INTO DISNEY_DIRECTOR VALUES 
        (P_MOVIE_TITLE, P_DIRNAME);

        RETURN P_STATUS;
    END;

SELECT * FROM DISNEY_DIRECTOR;

CALL SP_ADDDISNEY_DIRECTOR('Black Widow2','yu',?);

CALL SP_ADDDISNEY_DIRECTOR('Soul2','Pete Docter2',?);

CALL SP_ADDDISNEY_DIRECTOR('The One and Only Ivan2','Thea Sharrock2',?);



--ejercicio
DROP PROCEDURE SP_addDISNEYCharacters;

CREATE PROCEDURE SP_addDISNEYCharacters (IN P_NAME VARCHAR(100), P_VOICE VARCHAR (100), P_MOVIE VARCHAR(100), OUT P_STATUS INT)
    RESULT SETS 1
    LANGUAGE SQL
    BEGIN
        SET P_STATUS = 1;
        INSERT INTO DISNEY_VOICE_ACTORS VALUES
        (P_NAME, P_VOICE, P_MOVIE);
        RETURN P_STATUS;
    END;
SELECT * FROM DISNEY_VOICE_ACTORS;
CALL SP_addDISNEYCharacters('Cruella', 'Ann Hathaway', '101 Dalmatians: The Series', ?);
CALL SP_addDISNEYCharacters('ZEUS', 'Alan Menken', 'Hercules', ?);
CALL SP_addDISNEYCharacters('Dumbo', 'Max Medici', 'Dumbo', ?);
CALL SP_addDISNEYCharacters('Tiana', 'Anika Noni Rose', 'The Princess and the Frog', ?);
SELECT * FROM DISNEY_VOICE_ACTORS;



--ejemplo
CREATE PROCEDURE SP_ADDDISNEY_DIRECTOR(IN P_MOVIE_TITLE VARCHAR(100),IN P_DIRNAME VARCHAR(100), OUT p_status INT)
     RESULT SETS 1
     LANGUAGE SQL
   BEGIN
        DECLARE V_NAME  VARCHAR(100);
      SET P_STATUS=0;
     --identifica si ya existe un director para esa pelicula
    SELECT name INTO v_name from DISNEY_DIRECTOR  WHERE name=P_MOVIE_TITLE;
    IF (v_name IS NULL) then
        INSERT INTO DISNEY_DIRECTOR VALUES(P_MOVIE_TITLE,P_DIRNAME);
          SET P_STATUS=1;
    END IF;
     RETURN P_STATUS;
   END;



--ejercicio
CREATE PROCEDURE sp_getamtherovill(IN P_TYPE VARCHAR(1), OUT P_ROWS INT)
    RESULT SETS 1
    LANGUAGE SQL
    BEGIN
        IF (P_TYPE = 'V') THEN
            SET P_ROWS = (SELECT count(*) FROM DISNEY_CHARACTERS dc WHERE VILLIAN IS NOT NULL);
        END IF;
        IF (P_TYPE = 'H') then
            SET P_ROWS = (SELECT count(*) FROM DISNEY_CHARACTERS dc WHERE hero IS NOT NULL);
        END IF;
        RETURN P_ROWS;
    END;

CALL SP_GETAMTHEROVILL('V', ?);