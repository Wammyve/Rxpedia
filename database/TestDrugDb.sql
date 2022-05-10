use drugsdb;

/*
SELECT * FROM drugs;
SELECT * FROM brands;
*/

DELETE FROM drugs
WHERE drugID > 0;


DROP USER IF EXISTS java@localhost;

CREATE USER java@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES
ON drugsdb.* 
TO java@localhost;