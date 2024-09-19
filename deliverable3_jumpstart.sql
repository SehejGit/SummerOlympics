/*
1. In Postgres/BigQuery, create a database/schema that can house your data
*/
CREATE DATABASE Summer_Olympics;


/*
2. Write CREATE statements for each of your ERD tables. Save all the statements in one .sql file. 
Make sure to separate different statements with a ; . 
Also, make sure your code specifies PK and FK constraints.
3. Execute your CREATE statements on the platform of your choice (Postgres or BigQuery). 
If you choose BigQuery, you need to comment out the PK/FK constraint specifications.
*/
CREATE TABLE Athlete (
    athlete_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(20),
    country_code VARCHAR(20),
    country VARCHAR(100)
);

DROP TABLE ATHLETE;

CREATE TABLE Competition (
    event_id VARCHAR(36) PRIMARY KEY,
    sport VARCHAR(50),
    discipline VARCHAR(50),
    event VARCHAR(100),
    event_gender VARCHAR(20)
);

CREATE TABLE Olympics (
    olympic_year SMALLINT PRIMARY KEY,
    city VARCHAR(100)
);

CREATE TABLE Won (
    won_id VARCHAR(36) PRIMARY KEY,
    athlete_id VARCHAR(36),
    event_id VARCHAR(36),
    medal VARCHAR(20),
    FOREIGN KEY (athlete_id) REFERENCES Athlete(athlete_id),
    FOREIGN KEY (event_id) REFERENCES Competition(event_id)
);

CREATE TABLE Are_Held (
    held_id VARCHAR(36) PRIMARY KEY,
    event_id VARCHAR(36),
    olympic_year SMALLINT,
    FOREIGN KEY (event_id) REFERENCES Competition(event_id),
    FOREIGN KEY (olympic_year) REFERENCES Olympics(olympic_year)
);

/*
4. Import all your found datasets into your database; one table per dataset.
*/
/*4.1 Create a schema for your datasets*/
CREATE SCHEMA datasets;

/*4.2 Create a table in the datasets schema per dataset found*/
CREATE TABLE datasets.name_basics(
	nconst VARCHAR(250), --(string)alphanumeric unique identifier of the name/person
	primaryName VARCHAR(250), --(string) name by which the person is most often credited
	birthYear INT, -- in YYYY format
	deathYear INT, -- in YYYY format if applicable, else '\N'
	primaryProfession VARCHAR(500), --(array of strings) the top-3 professions of the person
	knownForTitles VARCHAR(500)--(array of tconsts)  titles the person is known for
);
/*4.3 import your data using the import wizard using the guide posted on Canvas*/
/*
5. Perform data wrangling by writing SELECT statements to 
create a result set suitable for each of your database tables.
*/
SELECT year, city
FROM DATASETS.CLEAN;

SELECT UUID_STRING(), athlete as name, gender, country_code, country
FROM DATASETS.CLEAN;

/*
6. To fill in your designed and created tables, write INSERT statements that 
take in the above SELECT statements.
*/
INSERT INTO PUBLIC.OLYMPICS(
    SELECT year, city
    FROM DATASETS.CLEAN
);

INSERT INTO PUBLIC.ATHLETE (athlete_id, name, gender, country_code, country)
SELECT UUID_STRING(), athlete as name, gender, country_code, country
FROM DATASETS.CLEAN;

/*
7. Finally query each filled table by writing a SELECT * FROM Table_Name LIMIT 10 . Take screenshots of your query and returned results. Use this templateLinks to an external site. to save your screenshots into a file. Download a .pdf version of the completed file. Please make sure to include a snapshot of your ERD diagram. Feel free to enhance and update your previously submitted ERD diagram.
*/
SELECT * FROM Actors LIMIT 10;