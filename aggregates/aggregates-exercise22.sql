--Calculate a rolling average of total revenue
CREATE TABLE cd.bookings
(
    facid     INTEGER PRIMARY KEY,
    memid     INTEGER,
    starttime TIMESTAMP,
    slots     INTEGER,
    FOREIGN KEY (memid) REFERENCES cd.members(memid),
    FOREIGN KEY (facid) REFERENCES cd.facilities (facid)
);

CREATE TABLE cd.facilities
(
    facid              INTEGER PRIMARY KEY,
    name               VARCHAR(100),
    membercost         NUMERIC(10, 2),
    guestcost          NUMERIC(10, 2),
    initialoutlay      INTEGER,
    monthlymaintenance INTEGER
);

INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES (0, 'Tennis Court 1',  5, 25	 , 10000, 200   ),
       (1, 'Tennis Court 2',  5, 25	 , 8000	, 200   ),
       (2, 'Badminton Court', 0, 15.5, 4000	, 50    ),
       (3, 'Table Tennis',    0, 5	 , 320	, 10    ),
       (4, 'Massage Room 1', 35, 80	 , 4000	, 3000  ),
       (5, 'Massage Room 2', 35, 80	 , 4000	, 3000  ),
       (6, 'Squash Court',  3.5, 17.5, 5000	, 80    ),
       (7, 'Snooker Table',   0, 5	 , 450	, 15    ),
       (8, 'Pool Table',      0, 5	 , 450	, 15    );

INSERT INTO cd.bookings (facid, memid, starttime, slots)
VALUES (0, 1, '2012-09-21 09:30:00', 1),
       (1, 2, '2012-09-21 10:00:00', 2),
       (2, 3, '2012-09-21 11:30:00', 1),
       (3, 4, '2012-09-21 12:00:00', 1),
       (4, 5, '2022-05-05 11:30:00', 2),
       (5, 6, '2022-06-25 13:00:00', 1),
       (6, 7, '2022-07-12 08:45:00', 1),
       (7, 8, '2022-08-18 17:30:00', 2),
       (8, 9, '2022-09-09 10:20:00', 1),
       (0, 10, '2022-10-30 15:10:00', 2);

SELECT date,
       (SELECT SUM( CASE
                        WHEN bks.memid = 0 THEN bks.slots * facs.guestcost
                        ELSE bks.slots * facs.membercost
                    END ) / 15 AS revenue
        FROM cd.bookings bks
                 INNER JOIN  cd.facilities facs ON bks.facid = facs.facid
        WHERE bks.starttime > dategen.date - INTERVAL '14 days'
              AND bks.starttime < dategen.date + INTERVAL '1 day'  ) AS revenue
FROM  ( SELECT generate_series(timestamp '2012-08-01', '2012-08-31', '1 day')::date AS date
      ) AS dategen
ORDER BY dategen.date;