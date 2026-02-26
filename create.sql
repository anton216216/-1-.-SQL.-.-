-- Genres table
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Artists table
CREATE TABLE artists (
    name VARCHAR(255) PRIMARY KEY
);

-- Artist-genre relationship table (many-to-many)
CREATE TABLE artist_genre (
    artist_id VARCHAR(255),
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(name) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

-- Albums table
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL CHECK (year > 1900)
);

-- Album-artist relationship table (many-to-many)
CREATE TABLE album_artist (
    album_id INT,
    artist_id VARCHAR(255),
    FOREIGN KEY (album_id) REFERENCES albums(id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artists(name) ON DELETE CASCADE,
    PRIMARY KEY (album_id, artist_id)
);

-- Tracks table
CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL, -- in seconds
    album INT NOT NULL,
    FOREIGN KEY (album) REFERENCES albums(id) ON DELETE CASCADE
);

-- Compilations table
CREATE TABLE compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL CHECK (year > 1900)
);

-- Track-compilation relationship table (many-to-many)
CREATE TABLE compilation_track (
    track_id INT,
    compilation_id INT,
    FOREIGN KEY (track_id) REFERENCES tracks(id) ON DELETE CASCADE,
    FOREIGN KEY (compilation_id) REFERENCES compilations(id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, compilation_id)
);
