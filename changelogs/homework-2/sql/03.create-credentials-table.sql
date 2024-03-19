CREATE TABLE credentials
(
    id       SERIAL PRIMARY KEY,
    user_id  INTEGER UNIQUE REFERENCES users (id),
    password VARCHAR(100) DEFAULT '{noop}1111',
    email    VARCHAR(50) NOT NULL UNIQUE,
    role_id  smallint REFERENCES role (id)
);

