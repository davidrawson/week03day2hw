DROP TABLE bounty_hunters;

CREATE TABLE bounty_hunters(
  id SERIAL4,
  name VARCHAR(255),
  species VARCHAR(255),
  weapon VARCHAR(255),
  bounty_value INT2
);
