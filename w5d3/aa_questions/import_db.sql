

-- DROP TABLE 


-- DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT,
    author_id TEXT NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)    
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)  
);

INSERT INTO
    users (fname, lname)
VALUES
    ('CJ', 'Jose'),
    ('Niko', 'Wells');

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('SQL Question', 'How do you insert things into a database?', (SELECT id FROM users WHERE lname = 'Jose') ),
    ('Ruby Question','How do you do recursion?', (SELECT id FROM users WHERE lname = 'Wells') );

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE lname = 'Jose'), (SELECT id FROM questions WHERE title = 'Ruby Question')),
    ((SELECT id FROM users WHERE lname = 'Wells'), (SELECT id FROM questions WHERE title = 'SQL Question'));

INSERT INTO 
    replies(question_id, user_id, body, parent_reply_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Ruby Question'), (SELECT id FROM users WHERE lname = 'Jose'),'You have to use magic', NULL),
    ((SELECT id FROM questions WHERE title = 'Ruby Question'), (SELECT id FROM users WHERE lname = 'Wells'),'But I don''t have magic powers', (SELECT id FROM replies WHERE body = 'You have to use magic'));

INSERT INTO 
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE lname = 'Jose'), (SELECT id FROM questions WHERE title = 'Ruby Question')),
    ((SELECT id FROM users WHERE lname = 'Wells'), (SELECT id FROM questions WHERE title = 'SQL Question'));
