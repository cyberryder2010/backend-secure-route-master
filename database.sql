
-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL,
    "access_level" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE "notes" (
    "id" SERIAL PRIMARY KEY,
    "content" VARCHAR (80) UNIQUE NOT NULL,
    "access_level" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE "user_notes" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "user" NOT NULL,
    "notes_id" INT REFERENCES "notes" NOT NULL
);

INSERT INTO "user" ("username", "password", "access_level")
VALUES ('Scott', 'itsASecret', 3),
('Rachael', 'notSoSecret', 0),
('Jackson', 'pokemonIsAwesome', 1),
('Myron', 'skyIsBlue', 2);

INSERT INTO "notes" ("content", "access_level")
VALUES ('Many things can be said about Fantastic things.', 3),
('Words are hard in the morning.', 0),
('Detective Pikachu is the only detective for me.', 1),
('A kittencorn is the most majestic creature in the history of made up creatures.', 2),
('I found an entire barrel of pens. Best day ever.', 0);

INSERT INTO "user_notes" ("user_id", "notes_id")
VALUES (2, 1),
(3, 2),
(3, 5),
(4, 3),
(5, 4);


