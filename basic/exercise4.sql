--Control which rows are retrieved - part 2
CREATE TABLE cd.facilities
(
    facid      INTEGER PRIMARY KEY,
    name       VARCHAR(100),
    membercost NUMERIC(10, 2),
    monthlymaintenance INTEGER
);

INSERT INTO cd.facilities (facid, name, membercost, monthlymaintenance)
VALUES (0, 'Tennis Court 1',  5,  200   ),
       (1, 'Tennis Court 2',  5,  200   ),
       (2, 'Badminton Court', 0,  50    ),
       (3, 'Table Tennis',    0,  10    ),
       (4, 'Massage Room 1', 35,  3000  ),
       (5, 'Massage Room 2', 35,  3000  ),
       (6, 'Squash Court',  3.5,  80    ),
       (7, 'Snooker Table',   0,  15    ),
       (8, 'Pool Table',      0,  15    );

select facid, name, membercost, monthlymaintenance
from cd.facilities
where membercost > 0 and (membercost < monthlymaintenance/50.0);