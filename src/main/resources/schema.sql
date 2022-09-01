CREATE TABLE IF NOT EXISTS mpa
(
    id   INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS films
(
    id           INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name         VARCHAR(40)  NOT NULL,
    description  VARCHAR(200) NOT NULL,
    duration     INTEGER      NOT NULL,
    release_date DATE         NOT NULL,
    mpa_id       INTEGER REFERENCES mpa (id) ON DELETE CASCADE,
    CONSTRAINT constr_description CHECK description <> '',
    CONSTRAINT constr_name CHECK name <> ''
        );


CREATE TABLE IF NOT EXISTS users
(
    id       INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name     VARCHAR(40)        NOT NULL,
    email    VARCHAR(40) UNIQUE NOT NULL,
    login    VARCHAR(40) UNIQUE NOT NULL,
    birthday DATE               NOT NULL
);


CREATE TABLE IF NOT EXISTS likes
(
    film_id INTEGER REFERENCES films (id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    PRIMARY KEY (FILM_ID, USER_ID)
);

CREATE TABLE IF NOT EXISTS genres
(
    id   INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS film_genre
(
    film_id  INTEGER REFERENCES films (id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres (id) ON DELETE CASCADE,
    PRIMARY KEY (film_id, genre_id)
);

CREATE TABLE IF NOT EXISTS friends_status
(
    id     INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    status VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS friends
(
    user1_id     INTEGER REFERENCES users (id) ON DELETE CASCADE,
    user2_id     INTEGER REFERENCES users (id) ON DELETE CASCADE,
    fs_status_id INTEGER REFERENCES friends_status (id) ON DELETE CASCADE,
    PRIMARY KEY (USER1_ID, USER2_ID)
);

CREATE TABLE IF NOT EXISTS directors
(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS film_directors
(
    film_id INTEGER REFERENCES films (id) ON DELETE CASCADE,
    director_id INTEGER REFERENCES directors (id) ON DELETE CASCADE,
    PRIMARY KEY (film_id, director_id)
);

CREATE TABLE IF NOT EXISTS reviews
(
    id          INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    content     VARCHAR(1000)                                   NOT NULL,
    is_positive BOOLEAN                                         NOT NULL,
    user_id     INTEGER REFERENCES users (id) ON DELETE CASCADE,
    film_id     INTEGER REFERENCES films (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS review_events
(
    user_id    INTEGER REFERENCES users (id) ON DELETE CASCADE,
    review_id  INTEGER REFERENCES reviews (id) ON DELETE CASCADE,
    event_type VARCHAR NOT NULL,
    CONSTRAINT pk_review_rates PRIMARY KEY (user_id, review_id
        )
);
CREATE TABLE IF NOT EXISTS review_rate
(
    id        INT AUTO_INCREMENT NOT NULL,
    review_id INTEGER REFERENCES reviews (id) ON DELETE CASCADE,
    rate      INT,
    CONSTRAINT pk_review_rate PRIMARY KEY (id
        )
);

CREATE TABLE IF NOT EXISTS events
(
    event_id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    entity_id INTEGER NOT NULL,
    event_type VARCHAR(10) NOT NULL,
    event_operation VARCHAR(10) NOT NULL ,
    event_timestamp LONG NOT NULL
);











