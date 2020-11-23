USE portfolio_db;
#Imported dataset into table 'vgsales' via Table Import Wizard
SELECT * FROM vgsales LIMIT 5;
#Question 1: Which platform has the highest number of video games on the list (sales greater than 100,000 copies)?
CREATE TABLE bestplatforms(gplatform VARCHAR(20), gcount INT);
INSERT INTO bestplatforms SELECT Platform, COUNT(*) FROM vgsales GROUP BY Platform;
SELECT * FROM bestplatforms ORDER BY gcount DESC;
#Answer: Nintendo DS
#Question 2: Which platform has the highest percentage of sales coming from North America?
ALTER TABLE vgsales ADD COLUMN napercent DOUBLE GENERATED ALWAYS AS (NA_Sales *100 / Global_Sales) STORED;
SELECT Platform, napercent FROM vgsales GROUP BY Platform ORDER BY napercent DESC;
#Answer: Atari 2600
#Question 3: From 2001-2005, what was the most successful genre of games on PlayStation 2?
SELECT Genre, COUNT(*) FROM vgsales WHERE (Platform = "PS2" AND Year = "2001") OR (Year = "2002") OR (Year = "2003") OR (Year = "2004") OR (Year = "2005") GROUP BY GENRE ORDER BY COUNT(*) DESC;
#Answer: Action
#Question 4: What was the most successful action game on the PS2 in 2004?
SELECT Name, Global_Sales FROM vgsales WHERE Platform = "PS2" AND GENRE = "Action" AND Year = "2004" ORDER BY Global_Sales DESC;
#Answer: Grand Theft Auto: San Andreas
