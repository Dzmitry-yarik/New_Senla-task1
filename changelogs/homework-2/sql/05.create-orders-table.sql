CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    user_id     INTEGER REFERENCES users (id),
    compilation TIMESTAMP      NOT NULL,
    payment     numeric(10, 2) NOT NULL
);