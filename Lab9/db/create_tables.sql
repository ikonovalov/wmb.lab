DROP TABLE themes;
CREATE TABLE themes (
         id INT,
         day INT,
         description VARCHAR(64)
       );
       
INSERT INTO themes (id, day, description) VALUES (1, 1, 'Environment');
INSERT INTO themes (id, day, description) VALUES (2, 1, 'Fundamentals');
INSERT INTO themes (id, day, description) VALUES (3, 2, 'Problem determination');
INSERT INTO themes (id, day, description) VALUES (4, 2, 'WebSphere MQ');
INSERT INTO themes (id, day, description) VALUES (5, 3, 'WebSphere MQ');
INSERT INTO themes (id, day, description) VALUES (6, 3, 'Message transformation');
INSERT INTO themes (id, day, description) VALUES (7, 4, 'Message transformation');
INSERT INTO themes (id, day, description) VALUES (8, 4, 'Message routing');
INSERT INTO themes (id, day, description) VALUES (9, 5, 'ESQL');
INSERT INTO themes (id, day, description) VALUES (10, 5, 'Configurable services');
INSERT INTO themes (id, day, description) VALUES (11, 6, 'Database interaction');
INSERT INTO themes (id, day, description) VALUES (12, 6, 'WebServices');
INSERT INTO themes (id, day, description) VALUES (13, 6, 'HTTP services');
INSERT INTO themes (id, day, description) VALUES (14, 7, 'Aggregation/Collectors');