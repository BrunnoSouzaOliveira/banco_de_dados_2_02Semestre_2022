DROP DATABASE IF EXISTS transaction_rollback;
CREATE DATABASE transaction_rollback;

USE transaction_rollback;

CREATE TABLE musics(
    id_music INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_of_music VARCHAR(255) NOT NULL,
    band VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT NOW()
);

INSERT INTO musics
    (name_of_music, band)
VALUES
    ('Bones',                 'Imagine Dragons'),
    ('Rhinestone Eyes',       'Gorillaz'),
    ('Can I Get a Witness',   'SonReal'),
    ('Providence',            'Poor Mans Poison'),
    ('Toxic',                 'BoyWithUke'),
    ('Heathens',              'Twenty One Pilots'),
    ('La Loto',               'Anitta');

SELECT "BEFORE DELETE ROW OF musics TABLE" AS 'LOG';

SELECT * FROM musics;

SET autocommit=0;

START TRANSACTION;
    ALTER TABLE musics ADD good TINYINT;

    UPDATE musics SET good = 1 WHERE band IN ('Imagine Dragons','Gorillaz','SonReal','Poor Mans Poison','BoyWithUke','Twenty One Pilots');
    UPDATE musics SET good = 0 WHERE band = 'Anitta';

SELECT "AFTER DELETE ROW OF musics TABLE" AS 'LOG';

SELECT * FROM musics;

ROLLBACK;

SELECT * FROM musics;