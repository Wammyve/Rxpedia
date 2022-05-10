use drugsdb;

DELETE FROM dosages WHERE dosageID;
DELETE FROM retailprices WHERE retailID;
DELETE FROM brands WHERE brandID;
DELETE FROM drugs WHERE drugID;

-- Create all the drugs first.
-- FORMAT: (ID, NAME, USE, DESCRIPTION, INTERACTIONS?)

INSERT INTO drugs
VALUES
	(1, 'Tylenol', 'Pain releiver', 'Tylenol is an OTC (over the counter) pain reliever used to treat common non-serious pain.', 'Y'),
	(2, 'Adderall', 'Stimulant', 'Adderall is an opiod pain releiver identified as a Schedule II narcotic drug. Adderall is commonly used to treat ADHD.', 'Y'),
    (3, 'Lipitor', 'Cholesterol', DEFAULT, 'Y'),
    (4, 'Amoxil', 'Antibiotic', DEFAULT, 'Y'),
    (5, 'Phenergan', 'Nausea', 'Promethazine is commonly used to help with allergy symptoms such as itching and runny noses, but it is also used to help treat nausea and vomiting.
								Promethazine is not to be used in children under 6 years of age, please consult with their physician first.', 'Y')
;


-- Create all the brands associated with the drugs.
-- FORMAT: (ID, DRUG ID, NAME, BRAND/GENERIC?)

INSERT INTO brands
VALUES
	(1, 1, 'Tylenol', 'Brand'),
	(2, 1, 'Acetaminophen', DEFAULT),
	(3, 2, 'Adderall', 'Brand'),
	(4, 2, 'Amphentamine Salts', DEFAULT),
    (5, 3, 'Lipitor', 'Brand'),
    (6, 3, 'Atorvastatin', DEFAULT),
    (7, 4, 'Amoxil', 'Brand'),
    (8, 4, 'Amoxicillin', DEFAULT),
    (9 ,5, 'Phenergan', 'Brand'),
    (10, 5, 'Promethazine', DEFAULT)
;


/*	Create dosages for all the drugs (different forms have different dosages usually).
	FORMAT: (ID, DRUG ID, DOSAGE TYPE, DOSAGE 1, DOSAGE 2, ..., DOSAGE 7)
	Valid dosage forms: Tablet, Chewable Tablet, Capsule, Oral Suspension
	Valid dosage types: mg, ml, mcg, mg/'n' ml, % (DOSAGE 1 MUST EXIST, rest can be null. Also, replace 'n' with a number i.e: mg/'n'mL -> mg/5ml)	*/
INSERT INTO dosages
VALUES
	(1, 1, DEFAULT,'mg', 325, 500, 650, NULL, NULL, NULL, NULL),
    (2, 2, DEFAULT,'mg', 5, 7.5, 10, 12.5, 15, 20, 30),
    (3, 3, DEFAULT,'mg', 10, 20, 40, 80, NULL, NULL, NULL),
    (4, 4, DEFAULT,'mg', 500, 875, NULL, NULL, NULL, NULL, NULL),
    (5, 4, 'Chewable Tablet','mg', 125, 250, NULL, NULL, NULL, NULL, NULL),
    (6, 4, 'Capsule','mg', 250, 500, NULL, NULL, NULL, NULL, NULL),
    (7, 5, 'Tablet', 'mg', 12.5, 25, 50, NULL, NULL, NULL, NULL),
    (8, 5, 'Syrup', 'mg/5 mL', 6.25, NULL, NULL, NULL, NULL, NULL, NULL)
;


/*	"Price match" (Do not worry for now, can't really do this)
	FORMAT: (ID, BRAND ID, GUALGREENS PRICE, CVS PRICE, COSCO PRICE)
	Prices are DECIMAL(10,2) i.e. 9999999999.99	*/
INSERT INTO retailprices
VALUES
	(1, 1, 69.00, 420.00, 255.00)
;