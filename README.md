# Backend Secure Routes

This version uses React, Redux, Express, Passport, and PostgreSQL (a full list of dependencies can be found in `package.json`). This version uses React to control the login requests and redirection in coordination with client-side routing.


## DOWNLOAD THIS REPOSITORY

> NOTE: Do not clone this repository.

* Don't Fork or Clone. Instead, have one memeber of your group click the `Clone or Download` button and select `Download Zip`.
* Unzip the project and start with the code in that folder.
* Create a new GitHub project and push this code to the new repository.


## Set up

### Prerequisites

Before you get started, make sure you have the following software installed on your computer:

- [Node.js](https://nodejs.org/en/)
- [PostrgeSQL](https://www.postgresql.org/)
- [Nodemon](https://nodemon.io/)

### Create Database and Table

Create a new database called `secure_notes` and create the following tables:

```SQL
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
```

### Start the Application

* Run `npm install`
* Start postgres if not running already by using `brew services start postgresql`
* Run `npm run server`
* Run `npm run client`
* Navigate to `localhost:3000`

