--List facilities with more than 1000 slots booked
CREATE TABLE cd.bookings
(
    facid     INTEGER PRIMARY KEY,
    memid     INTEGER,
    starttime TIMESTAMP,
    slots     INTEGER,
    FOREIGN KEY (memid) REFERENCES cd.members(memid),
    FOREIGN KEY (facid) REFERENCES cd.facilities (facid)
);

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

SELECT facid, sum(slots)
FROM cd.bookings
group by facid
having sum(slots) > 1000
order by facid;