-- drop tickets table first as it references the others.
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id SERIAL4 REFERENCES customers(id),
  film_id SERIAL4 REFERENCES films(id)
);
