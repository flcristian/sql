select * from table_name;
-- SELECTS EVERY COLUMN FROM THE TABLE

---------------------------------------------------------------

select column_name from table_name;
-- SELECTS ONLY THE COLUMN SPECIFIED
-- EXAMPLE :
select name from user;

---------------------------------------------------------------

-- YOU CAN SELECT MULTIPLE COLUMNS
select id,email,user_type from user;

---------------------------------------------------------------

-- YOU CAN ALIAS A COLUMN NAME
select id as index, email as email_adress,user_type from user;

---------------------------------------------------------------

-- YOU CAN ALSO SEARCH FOR CERTAIN THINGS
-- EXAMPLE : SEARCH FOR PACIENTS
select * from user where user_type = "Pacient";
-- EXAMPLE : SEARCH FOR THE FIRST 10 PACIENTS ALPHABETICALLY
select * from user where user_type = "Pacient" limit 10;

-- COMPARATORS :
=, >, <, >=, <=, <>

-- EXAMPLE : SEARCH FOR USERS THAT ARE NOT PACIENTS
select * from user where user_type <> "Pacient";

---------------------------------------------------------------

-- YOU CAN COMBINE CONDITIONS
-- EXAMPLE : SEARCH FOR PACIENTS THAT HAVE AN ID BIGGER THAN 10
select * from user where id > 10 and user_type = "Pacient";
-- EXAMPLE : SEARCH FOR DOCTORS OR PEOPLE CALLED "Dori Rehme"
select * from user where user_type = "Doctor" or name = "Dori Rehme";

---------------------------------------------------------------

-- YOU CAN SEARCH FOR MULTIPLE SPECIFIC VALUES
select * from user where id in (1, 4, 5, 6);
-- THIS WILL SELECT USERS WITH ID 1, 4, 5 AND 6

---------------------------------------------------------------

-- YOU CAN SEARCH FOR ITEMS BETWEEN SPECIFIC VALUES
-- EXAMPLE : SEARCH FOR PACIENTS THAT HAVE THEIR ID BETWEEN 5 AND 15
select * from user where user_type = "Pacient" and id between 5 and 15;

---------------------------------------------------------------

-- YOU CAN SEARCH FOR SPECIFIC PATTERNS USING WILDCARDS
-- % and _
-- % => Any number of characters before or after (depends where you place it)
-- _ => Any character

-- EXAMPLE : SEARCH FOR NAMES THAT START WITH THE LETTER "C"
select * from user where name like "C%";
 
-- EXAMPLE : SEARCH FOR PEOPLE THAT ARE BORN IN FEBRUARY
-- (ASUMING WE HAVE A PEOPLE TABLE THAT HAS AN AGE COLUMN)
select * from people where birth_date = "____-02-__";

---------------------------------------------------------------

-- UPDATING A COLUMN FOR ALL ROWS
-- EXAMPLE : CHANGING EVERY USER'S NAME TO "NAME"
update user set name = "Name";

---------------------------------------------------------------

-- UPDATING SPECIFIC ROWS
-- EXAMPLE : CHANGING THE EMAIL OF USER WITH ID 2
update user set email = "new_email" where id = 2;

---------------------------------------------------------------

-- DELETING ALL DATA FROM A TABLE
delete from user;

---------------------------------------------------------------

-- DELETING SPECIFIC ROWS
-- EXAMPLE: DELETING ALL DOCTORS
delete from user where user_type = "Doctor";

---------------------------------------------------------------

-- TRANSACTIONS : 
-- BEGIN A TRANSACTION :
begin transaction;
-- OR
begin;

-- SAVE DATABASE AND END TRANSACTION
commit;

-- ROLLBACK TO THE STATE BEFORE BEGINNING THE TRANSACTION
rollback;

---------------------------------------------------------------

-- ORDERING BY CRITERIAS
-- SINGLE CRIETRIA
select * from user order by name;
-- MULTIPLE CRITERIA
select * from user order by user_type,name;
-- ORDERING PRIORITY IS LEFT TO RIGHT
-- YOU CAN SORT IN DESCENDING ORDER
select * from user order by id desc;

---------------------------------------------------------------

-- LIMITING RESULTS
-- EXAMPLE : SEARCH FOR THE FIRST 10 ROWS IN THE TABLE
select * from user limit 10;
-- EXAMPLE WITH OFFSET, SEARCHING FOR THE FIRST 10 AFTER THE FIRST 10
select * from user limit 10, 10;
-- OR
select * from user limit 10 offset 10;

---------------------------------------------------------------

-- FUNCTIONS :

-- CONCAT("value1", "value2", "value3", . . .) - concatenate more strings
-- LENGTH(column) - get the length of a string
-- UPPER(column) - transform text to uppercase
-- LOWER(column) - transform text to lowercase
-- SUBSTR(string, start, length) - get a specific substring
-- REPLACE(column, target string, replacement string) - replace specific strings on a column
-- COUNT(column) - number of rows
-- SUM(column) - total sum of values on the column
-- AVG(column) - average value on the column
-- MAX(column) - get the maximum value
-- MIN(column) - get the minimum value

---------------------------------------------------------------

-- MATHEMATICAL OPERATORS : * / + -
-- EXAMPLE : 
select id * 10 from user;

---------------------------------------------------------------

-- GET THE CURRENT DATE :

-- CURDATE() - get the current date
-- CURTIME() - get the current time
-- NOW() - get the current date and time


-------------------------------------------------------------------------
-------------------------------------------------------------------------
-- QUERYING - RELATIONAL - QUERYING - RELATIONAL - QUERYING - RELATIONAL
-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- INNER JOIN
-- YOU CAN MERGE TWO TABLES INTO ONE BY USING THEIR COMMON VALUE, IN THIS CASE, THE USER ID
select username, image_url as image from users
    inner join photos on users.id = photos.user_id;


-- OUTER JOIN
-- YOU CAN MERGE TWO TABLES AND GET THE PHOTO COUNTS OF ALL USERS
select users.username, count(photos.image_url) as count from users
    left outer join photos on users.id = photos.user_id
group by users.username
order by count desc limit 2;

select users.username as User, count(follows.follower_id) as Followers from follows
    right outer join users on follows.followee_id = users.id
group by users.username
order by Followers desc limit 5;

-- MERGING DATA OPERATIONS
-- UNION
-- UNION ALL
-- INTERSECT
-- EXCEPT

-- SEE USERS WHO FOLLOW USER WITH ID 2 OR USER WITH ID 3
select username from users where id in
                           (select follower_id from follows where followee_id = 2
                           union
                           select follower_id from follows where followee_id = 3);

-- SEE USERS WHO FOLLOW BOTH USER WITH ID 2 AND USER WITH ID 3
select username from users where id in
                           (select follower_id from follows where followee_id = 2
                           intersect
                           select follower_id from follows where followee_id = 3);

-- SEE USERS WHO FOLLOW USER WITH ID 2 AND NOT USER WITH ID 3
select username from users where id in
                           (select follower_id from follows where followee_id = 2
                           except
                           select follower_id from follows where followee_id = 3);

-- SUBQUERIES
-- DISPLAY USERNAMES OF USERS THAT FOLLOW USER WITH ID 3
select username from users where id in (select follower_id from follows where followee_id = 3);