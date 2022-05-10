use drugsdb;

# SELECT * FROM drugs NATURAL JOIN brands;

CREATE OR REPLACE VIEW drugsAndBrands AS
SELECT drugID, drugName, brandID, brandName, brandType, drugUse, drugDesc, interactions
FROM drugs NATURAL JOIN brands;

SELECT * FROM drugsAndBrands;


CREATE OR REPLACE VIEW drugsAndDosages AS
SELECT drugID, dosageID, drugName, dosageForm, dosageType, d1, d2, d3, d4, d5, d6, d7 
FROM drugs JOIN dosages
	ON drugs.drugID = dosages.doDrugID
ORDER BY 1;

SELECT * FROM drugsAndDosages;

DROP USER IF EXISTS html@localhost;

CREATE USER html@localhost IDENTIFIED BY 'php';
GRANT ALL PRIVILEGES
ON drugsdb.* 
TO html@localhost;

CREATE OR REPLACE VIEW htmlView AS
SELECT drugName, brandName, brandType, drugUse, drugDesc, interactions
FROM drugs NATURAL JOIN brands;

SELECT * FROM htmlView;

# SELECT * FROM htmlView WHERE brandName = 'Tylenol';