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


