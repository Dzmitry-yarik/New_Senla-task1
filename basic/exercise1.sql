--Retrieve everything from a table
CREATE TABLE cd.facilities
(
    facid INTEGER PRIMARY KEY,
    name  VARCHAR(100)
);

INSERT INTO cd.facilities (facid, name)
VALUES (0, 'Tennis Court 1'),
       (1, 'Tennis Court 2'),
       (2, 'Badminton Court'),
       (3, 'Table Tennis'),
       (4, 'Massage Room 1'),
       (5, 'Massage Room 2'),
       (6, 'Squash Court'),
       (7, 'Snooker Table'),
       (8, 'Pool Table');

SELECT *
FROM cd.facilities