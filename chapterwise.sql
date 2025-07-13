--1. Database Creation This section covers how to create and remove databases.
-- Create a test database
CREATE DATABASE test;

-- Drop the test database
DROP DATABASE test;

-- Create the actual database for the record company
CREATE DATABASE record_company;
--• The CREATE DATABASE command is used to make a new database.
--• The DROP DATABASE command is used to delete an entire database, including all its tables and data. This command is rarely used in practice because it destroys data.

--2. Using a Database This command specifies which database your subsequent queries will interact with.
-- Specify which database to use for operations
USE record_company;
--• The USE command tells SQL which database you intend to run commands against. In MySQL Workbench, the selected database is often bolded.

--3. Table Creation & Altering These queries demonstrate how to create tables, add columns, and remove tables.
-- Create a simple test table with one column
CREATE TABLE test_table (test_column INT);

-- Alter the test_table to add another column
ALTER TABLE test_table ADD another_column VARCHAR(255);

-- Drop the test_table
DROP TABLE test_table;

-- Create the 'bands' table
-- ID is an INT, cannot be NULL, automatically increments, and is the PRIMARY KEY for unique identification.
-- name is a VARCHAR string up to 255 characters and cannot be NULL.
CREATE TABLE bands (
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

-- Create the 'albums' table
-- ID is INT, NOT NULL, AUTO_INCREMENT, and PRIMARY KEY.
-- name is VARCHAR(255) and NOT NULL.
-- release_year is an INT and can be NULL.
-- band_ID is an INT, NOT NULL, and is a FOREIGN KEY referencing the 'bands' table's ID column.
CREATE TABLE albums (
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (band_ID) REFERENCES bands(ID)
);
--• The CREATE TABLE command is used to define a new table and its columns, including their data types (e.g., INT, VARCHAR).
--• Constraints like NOT NULL (ensuring a column always has a value), AUTO_INCREMENT (for automatically generating unique IDs), and PRIMARY KEY (for uniquely identifying rows) are crucial for defining table structure.
--• The ALTER TABLE command allows you to modify an existing table, such as adding new columns, without losing existing data.
--• A FOREIGN KEY establishes a link between two tables, ensuring referential integrity. It references the PRIMARY KEY of another table.
--• The DROP TABLE command permanently removes a table and all its data.

--4. Inserting Data This section shows how to add new records into tables.
-- Insert a single band into the 'bands' table
INSERT INTO bands (name) VALUES ('Iron Maiden');

-- Insert multiple bands into the 'bands' table in a single statement
INSERT INTO bands (name) VALUES ('Deuce'), ('Avenged Sevenfold'), ('Anchor');

-- Insert multiple albums into the 'albums' table in a single statement
INSERT INTO albums (name, release_year, band_ID)
VALUES
    ('The Number of the Beast', 1985, 1),
    ('Powerslave', 1984, 1),
    ('Nightmare', 2018, 2),
    ('Nightmare', 2010, 3),
    ('Test Album', NULL, 3);
--• The INSERT INTO command is used to add new rows of data into a specified table and its columns.
--• The VALUES keyword is used to provide the actual data for the columns.
--• Multiple records can be inserted in a single INSERT INTO statement by separating value sets with commas.

--5. Selecting Data These queries demonstrate how to retrieve data from tables, including filtering, ordering, and aliasing columns.
-- Select all columns and all rows from the 'bands' table
SELECT * FROM bands;

-- Select all columns from 'bands', limiting the result to the first 2 rows
SELECT * FROM bands LIMIT 2;

-- Select only the 'name' column from the 'bands' table
SELECT name FROM bands;

-- Select 'ID' and 'name' columns from 'bands', aliasing their names in the result
SELECT ID AS 'ID', name AS 'Band Name' FROM bands;

-- Select all columns from 'bands', ordered alphabetically by 'name' (ascending by default)
SELECT * FROM bands ORDER BY name;

-- Select all columns from 'bands', ordered reverse alphabetically by 'name' (descending)
SELECT * FROM bands ORDER BY name DESC;

-- Select all columns from 'bands', explicitly ordered alphabetically by 'name' (ascending)
SELECT * FROM bands ORDER BY name ASC;

-- Select all columns and all rows from the 'albums' table
SELECT * FROM albums;

-- Select only the 'name' column from the 'albums' table
SELECT name FROM albums;

-- Select only unique album names from the 'albums' table
SELECT DISTINCT name FROM albums;
--• The SELECT command is fundamental for retrieving data.
--• SELECT * retrieves all columns.
--• LIMIT restricts the number of rows returned.
--• You can select specific columns by listing their names.
--• The AS keyword is used to alias (rename) columns in the output for better readability or specific programmatic use.
--• The ORDER BY clause sorts the result set based on one or more columns, either in ASC (ascending, default) or DESC (descending) order.
--• The DISTINCT keyword ensures that only unique values are returned for the specified column(s).

--6. Updating Data This query shows how to modify existing data in a table.
-- Update the 'release_year' for the album with ID = 1
UPDATE albums SET release_year = 1982 WHERE ID = 1;
--• The UPDATE command is used to change existing data in a table.
--• The SET clause specifies which column(s) to modify and their new values.
--• The WHERE clause is crucial to specify which row(s) to update; without it, all rows in the table would be updated.

--7. Filtering Data (WHERE Clause) The WHERE clause is used with SELECT, UPDATE, and DELETE to filter records based on specified conditions.
-- Select albums released before the year 2000
SELECT * FROM albums WHERE release_year < 2000;

-- Select albums where the name contains 'ER' (case-insensitive in MySQL)
SELECT * FROM albums WHERE name LIKE '%ER%';

-- Select albums where the name contains 'ER' OR the band ID is 2
SELECT * FROM albums WHERE name LIKE '%ER%' OR band_ID = 2;

-- Select albums released in 1984 AND by band ID 1
SELECT * FROM albums WHERE release_year = 1984 AND band_ID = 1;

-- Select albums with a release year between 2000 and 2018 (inclusive)
SELECT * FROM albums WHERE release_year BETWEEN 2000 AND 2018;

-- Select albums where the release year is NULL (not set)
SELECT * FROM albums WHERE release_year IS NULL;
--• The WHERE clause filters records based on conditions.
--• Comparison operators (<, =, >, <=, >=, !=) are used to define numerical or date conditions.
--• The LIKE operator is used for pattern matching with strings. The % wildcard matches any sequence of characters.
--• Logical operators like OR and AND combine multiple conditions.
--• BETWEEN selects values within a specified range (inclusive).
--• IS NULL checks for records where a column has no value.

--8. Deleting Data This query shows how to remove records from a table.
-- Delete the album with ID = 5
DELETE FROM albums WHERE ID = 5;
--• The DELETE FROM command removes rows from a table.
--• Similar to UPDATE, the WHERE clause is essential to specify which row(s) to delete. Without it, all rows would be removed.

--9. JOIN Statements JOIN operations combine rows from two or more tables based on related columns between them.
-- Inner Join (default JOIN type): Returns only rows where there is a match in both 'bands' and 'albums' tables.
SELECT * FROM bands
JOIN albums ON bands.ID = albums.band_ID;

-- Explicit Inner Join: Same as the default JOIN.
SELECT * FROM bands
INNER JOIN albums ON bands.ID = albums.band_ID;

-- Left Join: Returns all rows from the left table ('bands'), and the matched rows from the right table ('albums').
-- If there's no match, NULLs are returned for the right table's columns.
SELECT * FROM bands
LEFT JOIN albums ON bands.ID = albums.band_ID;

-- Right Join: Returns all rows from the right table ('bands' in this rearranged example),
-- and the matched rows from the left table ('albums').
-- If there's no match, NULLs are returned for the left table's columns.
SELECT * FROM albums
RIGHT JOIN bands ON bands.ID = albums.band_ID;
--• JOIN (or INNER JOIN) returns only the rows that have matching values in both joined tables.
--• LEFT JOIN returns all rows from the "left" table (the first table listed in the FROM clause) and the matching rows from the "right" table. If no match is found on the right, NULL values are returned for the right table's columns.
--• RIGHT JOIN returns all rows from the "right" table and the matching rows from the "left" table. If no match is found on the left, NULL values are returned for the left table's columns.
--• The ON clause specifies the condition (usually equality of IDs) that links the rows between the tables.

--10. Aggregate Functions Aggregate functions perform calculations on a set of rows and return a single summary value.
-- Calculate the average release year of all albums
SELECT AVG(release_year) FROM albums;

-- Calculate the sum of all release years of all albums
SELECT SUM(release_year) FROM albums;

-- Count the total number of albums
SELECT COUNT(*) FROM albums;
--• AVG() calculates the average value of a numeric column.
--• SUM() calculates the sum of all values in a numeric column.
--• COUNT() counts the number of rows or non-NULL values in a column.

--11. Grouping Data (GROUP BY) The GROUP BY clause groups rows that have the same values in specified columns into a summary row, often used with aggregate functions.
-- Group albums by band ID and count the number of albums per band
SELECT band_ID, COUNT(band_ID) FROM albums GROUP BY band_ID;
--• GROUP BY combines rows with identical values in a specified column (or columns) into a single summary row.
--• Aggregate functions then operate on these groups rather than the entire dataset.

--12. Combining JOIN, GROUP BY, and Aliases This section demonstrates how to build more complex queries by combining multiple concepts.
-- Select the band name and count of albums for each band, including bands with no albums
SELECT B.name AS 'Band Name', COUNT(A.ID) AS 'Number of Albums'
FROM bands AS B
LEFT JOIN albums AS A ON B.ID = A.band_ID
GROUP BY B.ID;
--• This query uses a LEFT JOIN to ensure all bands are included, even if they have no albums.
--• Table aliases (e.g., bands AS B, albums AS A) make the query more concise and readable.
--• COUNT(A.ID) specifically counts albums based on their ID within each group.
--• GROUP BY B.ID ensures that the aggregation is performed for each unique band ID.

--13. Filtering Aggregated Data (HAVING Clause) The HAVING clause filters groups based on conditions, often involving aggregate functions.
-- Select band name and album count, showing only bands with exactly 1 album
SELECT B.name AS 'Band Name', COUNT(A.ID) AS 'Number of Albums'
FROM bands AS B
LEFT JOIN albums AS A ON B.ID = A.band_ID
GROUP BY B.ID
HAVING COUNT(A.ID) = 1;

-- Select band name and album count, filtering by band name (WHERE) AND album count (HAVING)
SELECT B.name AS 'Band Name', COUNT(A.ID) AS 'Number of Albums'
FROM bands AS B
LEFT JOIN albums AS A ON B.ID = A.band_ID
WHERE B.name = 'Deuce'
GROUP BY B.ID
HAVING COUNT(A.ID) > 0;
--• The HAVING clause is similar to WHERE, but it applies filters to groups after the GROUP BY operation, allowing you to filter based on aggregate function results.
--• A WHERE clause is applied before GROUP BY to filter individual rows, while HAVING is applied after GROUP BY to filter the aggregated groups.
--------------------------------------------------------------------------------
