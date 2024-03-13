--Retrieve specific columns from a table
CREATE TABLE cd.facilities
(
    facid      INTEGER PRIMARY KEY,
    name       VARCHAR(100),
    membercost NUMERIC(10, 2)
);

INSERT INTO cd.facilities (facid, name, membercost)
VALUES (0, 'Tennis Court 1', 5),
       (1, 'Tennis Court 2', 5),
       (2, 'Badminton Court', 0),
       (3, 'Table Tennis', 0),
       (4, 'Massage Room 1', 35),
       (5, 'Massage Room 2', 35),
       (6, 'Squash Court', 3.5),
       (7, 'Snooker Table', 0),
       (8, 'Pool Table', 0);

select name, membercost
from cd.facilities;
