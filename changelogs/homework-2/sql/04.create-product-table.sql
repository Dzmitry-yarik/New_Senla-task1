CREATE TABLE product
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100)   NOT NULL,
    price    numeric(10, 2) NOT NULL,
    discount numeric(10, 2) NOT NULL,
    quantity INTEGER
);
