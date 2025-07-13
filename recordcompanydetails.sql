Here are the SQL queries demonstrated in the video, along with their functions and use cases:
• CREATE DATABASE test;
    ◦ Function/Use Case: This command is used to create a new database. In this specific example, it creates a database named test.
• DROP DATABASE test;
    ◦ Function/Use Case: This command is used to delete an existing database. When you DROP a database, it removes all tables and all data within that database permanently. The sources note that this command is almost never used in practice because it destroys data, but it's good to know it exists.
• CREATE DATABASE record_company;
    ◦ Function/Use Case: Similar to the first CREATE DATABASE example, this command creates the actual database intended for the video's examples, named record_company.
• USE record_company;
    ◦ Function/Use Case: This command is used to select or set the active database. Once executed, all subsequent SQL queries will operate on the record_company database until another USE command is issued or the session ends. This is crucial so that SQL knows which database to modify or query.
• CREATE TABLE test_table (test_column INT);
    ◦ Function/Use Case: This command is used to create a new table within the currently selected database. You define the table name (test_table) and then, within parentheses, specify the column names and their data types. Here, it creates a table with one column named test_column of type INT (integer).
• ALTER TABLE test_table ADD another_column VARCHAR(255);
    ◦ Function/Use Case: This command is used to modify an existing table's structure. Specifically, the ADD keyword allows you to add a new column to a table after it has been created. In this case, it adds another_column of type VARCHAR with a maximum length of 255 characters to the test_table. This is useful for changing a table without losing existing data.
• DROP TABLE test_table;
    ◦ Function/Use Case: Similar to DROP DATABASE, this command is used to delete an entire table from the database, along with all the data contained within it.
• CREATE TABLE bands (ID INT NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL, PRIMARY KEY (ID));
    ◦ Function/Use Case: This is a more detailed example of CREATE TABLE for the bands table. It defines two columns:
        ▪ ID: An INT (integer) that is NOT NULL (must have a value), AUTO_INCREMENT (automatically generates a unique, incrementing number for new records), and is designated as the PRIMARY KEY. A PRIMARY KEY uniquely identifies each record (row) in the table and allows for quick queries based on this ID.
        ▪ name: A VARCHAR(255) (variable-length string up to 255 characters) that is also NOT NULL, ensuring every band has a name.
• CREATE TABLE albums (ID INT NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL, release_year INT, band_id INT NOT NULL, PRIMARY KEY (ID), FOREIGN KEY (band_id) REFERENCES bands(ID));
    ◦ Function/Use Case: This command creates the albums table, demonstrating the concept of a foreign key to establish relationships between tables. It includes:
        ▪ ID: The PRIMARY KEY for the albums table.
        ▪ name: The album's name, VARCHAR(255) and NOT NULL.
        ▪ release_year: The album's release year, an INT, which can be NULL (optional).
        ▪ band_id: An INT that is NOT NULL. This column is defined as a FOREIGN KEY (band_id) REFERENCES bands(ID). This means that the band_id in the albums table must correspond to an existing ID in the bands table, ensuring data integrity. It prevents creating albums for non-existent bands and deleting bands that still have associated albums.
• INSERT INTO bands (name) VALUES ('Iron Maiden');
    ◦ Function/Use Case: This command is used to add new records (rows) into a table. INSERT INTO specifies the table name (bands) and the columns you are providing values for (name). VALUES then lists the actual data ('Iron Maiden'). The ID column is omitted because it's AUTO_INCREMENT.
• INSERT INTO bands (name) VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');
    ◦ Function/Use Case: This demonstrates inserting multiple records into a table with a single INSERT statement. You provide comma-separated sets of values within parentheses, each set representing a new row to be inserted.
• SELECT * FROM bands;
    ◦ Function/Use Case: This is a fundamental query command used to retrieve data from a table. The * (asterisk) signifies "all columns," so this query retrieves all columns and all rows from the bands table.
• SELECT * FROM bands LIMIT 2;
    ◦ Function/Use Case: This SELECT statement includes the LIMIT clause, which restricts the number of rows returned by the query. In this case, it will only return the first 2 records from the bands table.
• SELECT name FROM bands;
    ◦ Function/Use Case: Instead of *, you can specify individual column names to retrieve only certain columns from a table. This query will only return the name column for all records in the bands table.
• SELECT ID AS ID, name AS band_name FROM bands;
    ◦ Function/Use Case: This SELECT statement uses the AS keyword to alias (rename) columns in the query's output. The ID column is aliased as ID (all caps), and the name column is aliased as band_name. This can make query results more readable or align with naming conventions for an application.
• SELECT * FROM bands ORDER BY name;
    ◦ Function/Use Case: The ORDER BY clause is used to sort the results of a SELECT query. By default, it sorts in ascending order. Here, it retrieves all columns from bands and sorts them alphabetically by the name column.
• SELECT * FROM bands ORDER BY name DESC;
    ◦ Function/Use Case: Adding DESC (descending) after the column name in ORDER BY sorts the results in reverse order. This query sorts the bands table by name in reverse alphabetical order.
• INSERT INTO albums (name, release_year, band_id) VALUES ('The Number Of The Beast', 1985, 1), ('Powerslave', 1984, 1), ('Nightmare', 2018, 2), ('Nightmare', 2010, 3), ('Test Album', NULL, 3);
    ◦ Function/Use Case: This is another example of inserting multiple records, this time into the albums table. It also demonstrates inserting a NULL value for release_year for the 'Test Album' where no release date is known, which is allowed because the release_year column was not defined as NOT NULL.
• SELECT * FROM albums;
    ◦ Function/Use Case: Retrieves all columns and rows from the albums table, showing the newly inserted data.
• SELECT name FROM albums;
    ◦ Function/Use Case: Retrieves only the name column from the albums table. This example highlights that duplicate names (like 'Nightmare') will appear if not filtered.
• SELECT DISTINCT name FROM albums;
    ◦ Function/Use Case: The DISTINCT keyword is used in a SELECT statement to return only unique values for the specified column(s), eliminating duplicates. In this case, it will return 'Nightmare' only once, even though two albums have that name.
• UPDATE albums SET release_year = 1982 WHERE ID = 1;
    ◦ Function/Use Case: The UPDATE command is used to modify existing data in a table. SET specifies the column (release_year) and its new value (1982). The WHERE clause is critically important here, as it filters which records to update. Without WHERE ID = 1, this command would update the release_year for every album in the table.
• SELECT * FROM albums WHERE release_year < 2000;
    ◦ Function/Use Case: The WHERE clause is extensively used to filter results from SELECT queries based on specified conditions. This query retrieves all albums where the release_year is less than 2000.
• SELECT * FROM albums WHERE name LIKE '%er%';
    ◦ Function/Use Case: The LIKE operator is used with WHERE to perform pattern matching on string data. The percent sign (%) acts as a wildcard, representing any sequence of zero or more characters. This query retrieves albums where the name contains "er" anywhere within the string.
• SELECT * FROM albums WHERE name LIKE '%er%' OR band_id = 2;
    ◦ Function/Use Case: This demonstrates combining multiple conditions in a WHERE clause using the OR logical operator. The query will return records where either the name contains "er" or the band_id is 2.
• SELECT * FROM albums WHERE release_year = 1984 AND band_id = 1;
    ◦ Function/Use Case: This shows combining conditions using the AND logical operator. This query will only return records where both the release_year is 1984 and the band_id is 1. Both conditions must be true for a record to be included.
• SELECT * FROM albums WHERE release_year BETWEEN 2000 AND 2018;
    ◦ Function/Use Case: The BETWEEN operator is used in a WHERE clause to filter records within a specified range (inclusive). This query returns albums released between the years 2000 and 2018 (including those years).
• SELECT * FROM albums WHERE release_year IS NULL;
    ◦ Function/Use Case: This WHERE clause uses IS NULL to find records where a specific column has no value (is null). This query finds albums that do not have a release_year specified.
• DELETE FROM albums WHERE ID = 5;
    ◦ Function/Use Case: The DELETE FROM command is used to remove records (rows) from a table. Similar to UPDATE, the WHERE clause is crucial to specify which records to delete. Without WHERE ID = 5, this command would delete every record from the albums table.
• SELECT * FROM bands JOIN albums ON bands.ID = albums.band_id;
    ◦ Function/Use Case: This is a basic form of an INNER JOIN (the default when just JOIN is used). It combines rows from two or more tables (bands and albums) based on a related column between them. The ON clause specifies the join condition, matching bands.ID with albums.band_id. This query returns all band and album information for records that have a match in both tables, effectively showing bands that have albums and their associated albums.
• SELECT * FROM bands INNER JOIN albums ON bands.ID = albums.band_id;
    ◦ Function/Use Case: Explicitly states an INNER JOIN. It functions identically to the basic JOIN command, returning only records that have matching values in both the "left" table (bands) and the "right" table (albums).
• SELECT * FROM bands LEFT JOIN albums ON bands.ID = albums.band_id;
    ◦ Function/Use Case: A LEFT JOIN returns all records from the "left" table (the first table listed, bands in this case) and the matching records from the "right" table (albums). If there are no matching records in the "right" table, NULL values are returned for the columns from the "right" table. This is useful when you want to see all records from one table, even if they don't have corresponding entries in the joined table (e.g., all bands, even those with no albums).
• SELECT * FROM albums RIGHT JOIN bands ON albums.band_id = bands.ID;
    ◦ Function/Use Case: A RIGHT JOIN returns all records from the "right" table (the second table listed, bands in this example) and the matching records from the "left" table (albums). If there are no matching records in the "left" table, NULL values are returned for the columns from the "left" table. It's essentially the inverse of a LEFT JOIN.
• SELECT AVG(release_year) FROM albums;
    ◦ Function/Use Case: AVG() is an aggregate function that calculates the average value of a numeric column across all rows returned by the query. Here, it computes the average release_year for all albums.
• SELECT SUM(release_year) FROM albums;
    ◦ Function/Use Case: SUM() is another aggregate function that calculates the sum of all values in a numeric column for the returned rows.
• SELECT band_id, COUNT(band_id) FROM albums GROUP BY band_id;
    ◦ Function/Use Case: This query combines an aggregate function (COUNT()) with the GROUP BY clause. COUNT(band_id) counts the number of band_id entries. The GROUP BY band_id clause groups rows that have the same band_id together. The COUNT() function then operates on these groups. This query effectively shows how many albums each unique band ID has.
• SELECT B.name AS band_name, COUNT(A.ID) AS number_of_albums FROM bands AS B LEFT JOIN albums AS A ON B.ID = A.band_id GROUP BY B.ID;
    ◦ Function/Use Case: This is a more advanced query combining multiple concepts:
        ▪ Aliases: bands AS B and albums AS A shorten table names for easier querying (B.name, A.ID).
        ▪ Left Join: Ensures all bands are included, even if they have no albums.
        ▪ Aggregate Function with Group By: COUNT(A.ID) counts the albums, and GROUP BY B.ID groups these counts by each band's ID.
        ▪ Aliased Columns in Select: B.name AS band_name and COUNT(A.ID) AS number_of_albums provide more readable column headers in the output.
    ◦ The overall purpose is to display each band's name and the total number of albums associated with them, including bands that have zero albums.
• SELECT B.name AS band_name, COUNT(A.ID) AS number_of_albums FROM bands AS B LEFT JOIN albums AS A ON B.ID = A.band_id GROUP BY B.ID HAVING number_of_albums = 1;
    ◦ Function/Use Case: This query introduces the HAVING clause. The HAVING clause is similar to WHERE but is used to filter results after the GROUP BY clause and aggregate functions have been applied. You cannot filter by aggregate results directly with WHERE because WHERE operates before grouping. This query returns only the bands that have exactly one album.
• SELECT B.name AS band_name, COUNT(A.ID) AS number_of_albums FROM bands AS B LEFT JOIN albums AS A ON B.ID = A.band_id WHERE B.name = 'Deuce' GROUP BY B.ID HAVING number_of_albums = 1;
    ◦ Function/Use Case: This final example combines both WHERE and HAVING clauses.
        ▪ The WHERE clause (WHERE B.name = 'Deuce') filters individual rows before they are grouped.
        ▪ The HAVING clause (HAVING number_of_albums = 1) then filters the groups created by GROUP BY after the aggregate function (COUNT) has been applied.
    ◦ This query specifically looks for the band named 'Deuce' and then checks if that band has exactly one album.
