CREATE TABLE accessories(
acces_id  INT PRIMARY KEY NOT NULL,
NAME       CHAR(25) NOT NULL,
country  CHAR(25) NOT NULL,
amount INT PRIMARY KEY NOT NULL
);
INSERT INTO accessories (ID, NAME ,country, amount)
VALUES (1, 'Phone box', "China" );

INSERT INTO accessories(ID, NAME ,country, amount)
VALUES (2, 'Screen', "China" );

INSERT INTO accessories (ID, NAME ,country, amount)
VALUES (3, 'Headphone', "Turkish" );


CREATE TABLE list_of_ac(
    list_id bigserial,
    name char(25) NOT NULL,
    price INT NOT NULL,
    color char(25) NOT NULL,
    comming_date date,
    FOREIGN KEY (list_id) REFERENCES accessories (acces_id)
);

INSERT INTO list_of_ac (name,price,color,comming_date)
VALUES ('Paul', 150 , ak,
        'Teddy', 250 , bek);

 
INSERT INTO list_of_ac (name,price,comming_date)
VALUES ('Mark ', 50 ,kok);


INSERT INTO TABLE_NAME(COLUMN_NAME) VALUES(VALUE_DATA);

SELECT
        accessories.acces_id,
        accessories.NAME,
        accessories.amount,
        list_of_ac.list_id,
        list_of_ac.price,
        list_of_ac.comming_date
FROM
        accessories
INNER JOIN
        list_of_ac ON accessories.acces_id = list_of_ac.list_id;
CREATE TABLE sell_tab(
    id bigserial,
    name char(25) NOT NULL,
    price INT NOT NULL,
    comming_date date,
    seller char(25) NOT NULL
);
