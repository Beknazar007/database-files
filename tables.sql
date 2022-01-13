CREATE TABLE accessories(
acces_id  INT PRIMARY KEY NOT NULL,
NAME       CHAR(25) NOT NULL,
country  CHAR(25) NOT NULL,
amount INT  NOT NULL
);
CREATE TABLE stud_diary(
userId          INT PRIMARY KEY NOT NULL,

coming          CHAR(50) NOT NULL,
leaving         CHAR(50) NOT NULL,
studying        CHAR(50) NOT NULL,
recDate         date     NOT NULL
);
 
INSERT INTO users_time2 (coming,leaving,studying,recDate)
VALUES ('nur', 'nur' ,'nur','2020-10-10');

CREATE TABLE studs(
last_name       CHAR(10) PRIMARY KEY NOT NULL,
login           CHAR(10) NOT NULL,
password        CHAR(10) NOT NULL
);

CREATE TABLE studs22(
last_name       CHAR(10) PRIMARY KEY NOT NULL,
login           CHAR(10) NOT NULL,
password        CHAR(10) NOT NULL
);
S
INSERT INTO studs (last_name  ,login, password)
VALUES ('sait', 'China' ,'asdf');

INSERT INTO studs22 (last_name  ,login, password)
VALUES ('nur', 'nur' ,'nur');

SELECT * FROM studs,studs22 WHERE last_name = 'sait' ;





INSERT INTO accessories(acces_id , NAME ,country, amount)
VALUES (2, 'Screen', 'China' ,13 );

INSERT INTO accessories (acces_id , NAME ,country, amount)
VALUES (3, 'Headphone', 'Turkish',4 );


CREATE TABLE list_of_ac(
    list_id bigserial,
    name char(25) NOT NULL,
    price INT NOT NULL,
    color char(25) NOT NULL,
    comming_date date,
    FOREIGN KEY (list_id) REFERENCES accessories (acces_id)
);

INSERT INTO list_of_ac (name,price,color)
VALUES ('Paul', 150 , 'ak');

 
INSERT INTO list_of_ac (name,price,color)
VALUES ('Mark ', 50 ,'kok');




SELECT
        accessories.acces_id,
        accessories.NAME,
        accessories.amount,
        list_of_ac.list_id,
        list_of_ac.price,
        list_of_ac.comming_date
FROM
        accessories
INNER JOIN list_of_ac
        ON accessories.acces_id = list_of_ac.list_id;
        ON accessories.amount = list_of_ac.comming_date;
        ON accessories.NAME = list_of_ac.price;
        
create user sait with encrypted password 'mypassword';
grant all privileges on database postgres to sait;
alter role sait with login;
CREATE ROLE demo_role;
DROP ROLE demo_role;
DROP ROLE IF EXISTS role_name;
CREATE ROLE role_name WITH optional_permissions;
\h CREATE ROLE

CREATE ROLE demo_role WITH LOGIN;

CREATE USER role_name;
The only difference between the two commands is that "CREATE USER" automatically gives the role login privileges.