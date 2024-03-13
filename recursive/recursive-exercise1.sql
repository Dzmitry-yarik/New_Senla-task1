--Find the upward recommendation chain for member ID 27
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

WITH RECURSIVE recommenders(recommender) AS (
    SELECT recommendedby
    FROM cd.members
    WHERE memid = 27

    UNION ALL

    SELECT mem.recommendedby
    FROM recommenders rec
             JOIN cd.members mem
                  ON mem.memid = rec.recommender
)

SELECT rec.recommender, mem.firstname, mem.surname
FROM recommenders rec
         JOIN cd.members mem
              ON rec.recommender = mem.memid
ORDER BY rec.recommender DESC;