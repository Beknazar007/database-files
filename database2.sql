CREATE TABLE DATE_OF_REPORT(
   first_name_user VARCHAR(50),
   DATE_OF_REPORT VARCHAR(25),
   week_id int,
   coming  time,
   leaving  time,
   studying  time,
   covered_topics VARCHAR(100)
   );


INSERT INTO DATE_OF_REPORT(first_name_user,DATE_OF_REPORT,coming,leaving,studying,covered_topics)
VALUES('AKY','Monday','8:30','19:00', '10:00','Final PostgreSQL');

CREATE TABLE EACH_WEEK(
   first_name_user VARCHAR(50),
   coming_ave  time,
   leaving_ave  time,
   studying_ave  time
   
   );

 

CREATE OR REPLACE FUNCTION add_to_week() 
   RETURNS trigger AS $$
BEGIN

      INSERT INTO EACH_WEEK(first_name_user,coming_ave,leaving_ave,studying_ave)   
      VALUES(NEW.first_name_user,NEW.coming ,NEW.leaving ,NEW.studying );
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;
 
CREATE TRIGGER IST_TOT_RES
   AFTER INSERT
   ON EACH_DAY
   FOR EACH ROW
   EXECUTE PROCEDURE add_to_week();

SELECT * FROM EACH_DAY;

SELECT * FROM EACH_WEEK;
