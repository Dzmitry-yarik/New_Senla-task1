--Find the total revenue of each facility
CREATE TABLE cd.members
(
    memid         INTEGER PRIMARY KEY,
    surname       VARCHAR(200),
    firstname     VARCHAR(200),
    address       VARCHAR(300),
    zipcode       INTEGER,
    telephone     VARCHAR(20),
    recommendedby INTEGER,
    joindate      TIMESTAMP
);

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

INSERT INTO cd.members (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate)
VALUES
    (1, 'Smith', 'John', 'Минск', 12345, '5551234', 0, '2022-01-01 10:00:00'),
    (2, 'Johnson', 'Alice', 'Гродно', 23456, '5555678', 1, '2022-02-15 14:30:00'),
    (3, 'Williams', 'David', 'Брест', 34567, '5559012', 0, '2022-03-10 09:15:00'),
    (4, 'Jones', 'Sarah', 'Могилев', 45678, '5553456', 2, '2022-04-20 16:45:00'),
    (5, 'Brown', 'Michael', 'Витебск', 56789, '5557890', 1, '2022-05-05 11:30:00'),
    (6, 'Farrell', 'David', 'Гомель', 67890, '5552345', 4, '2022-06-25 13:00:00'),
    (7, 'Miller', 'Jessica', 'Гродно', 78901, '5556789', 3, '2022-07-12 08:45:00'),
    (8, 'Wilson', 'Robert', 'Минск', 89012, '5550123', 0, '2022-08-18 17:30:00'),
    (9, 'Taylor', 'William', 'Брест', 90123, '5554567', 5, '2022-09-09 10:20:00'),
    (10, 'Anderson', 'Karen', 'Витебск', 01234, '5558901', 0, '2022-10-30 15:10:00');

INSERT INTO cd.bookings (facid, memid, starttime, slots)
VALUES
    (0, 1, '2022-01-01 10:00:00', 1),
    (1, 2, '2022-02-15 14:30:00', 2),
    (2, 3, '2022-03-10 09:15:00', 1),
    (3, 4, '2022-04-20 16:45:00', 1),
    (4, 5, '2022-05-05 11:30:00', 2),
    (5, 6, '2022-06-25 13:00:00', 1),
    (6, 7, '2022-07-12 08:45:00', 1),
    (7, 8, '2022-08-18 17:30:00', 2),
    (8, 9, '2022-09-09 10:20:00', 1),
    (0, 10, '2022-10-30 15:10:00', 2);

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

SELECT f.name, SUM(CASE
                       WHEN m.memid = 0 THEN f.guestcost * b.slots
                       ELSE f.membercost * b.slots
                    END) AS revenue
FROM cd.facilities f
         JOIN cd.bookings b USING(facid)
         JOIN cd.members m  USING(memid)
GROUP BY f.name
ORDER BY revenue;