--More aggregation
CREATE TABLE cd.members
(
    memid     INTEGER PRIMARY KEY,
    surname   VARCHAR(100),
    firstname VARCHAR(100),
    joindate  TIMESTAMP
);

INSERT INTO cd.members (memid, surname, firstname, joindate)
VALUES
    (24, 'Bader', 'Ramnaresh', '2012-09-01 08:44:42'),
    (26, 'Baker', 'Douglas', '2012-09-02 18:43:05'),
    (27, 'Boothe', 'Henrietta', '2012-09-05 08:42:35'),
    (28, 'Butters', 'David', '2012-09-15 08:22:05'),
    (29, 'Coplin', 'Henry', '2012-09-17 12:27:15'),
    (30, 'Crumpet', 'Millicent', '2012-09-18 19:04:01'),
    (33, 'Dare', 'Hyacinth', '2012-09-18 19:32:05'),
    (35, 'Farrell', 'John', '2012-09-19 11:32:45'),
    (36, 'GUEST', 'Erica', '2012-09-22 08:36:38'),
    (37, 'Genting', 'Darren', '2012-09-26 18:08:45');

SELECT  firstname, surname, joindate
FROM cd.members
order by joindate desc
limit 1;


