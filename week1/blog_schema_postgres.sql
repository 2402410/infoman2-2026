-- PostgreSQL Schema for Blog Database

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Data for the tables
INSERT INTO users (username) VALUES
('alice'), ('bob'), ('carol'), ('dave'), ('erin'), ('frank'), ('grace');

INSERT INTO posts (user_id, title, body) VALUES
(1, 'First Post!', 'This is the body of the first post.'),
(2, 'Bob''s Thoughts', 'A penny for my thoughts.'),
(3, 'Hello World', 'Carol joins the blog.'),
(4, 'Tech Talk', 'Dave talks about tech.'),
(5, 'Daily Musings', 'Erin shares her thoughts.'),
(6, 'Food Review', 'Frank reviews his lunch.'),
(7, 'Travel Plans', 'Grace talks about traveling.');

INSERT INTO comments (post_id, user_id, comment) VALUES
(1, 2, 'Great first post, Alice!'),
(2, 1, 'Interesting thoughts, Bob.'),
(3, 1, 'Welcome to the blog, Carol!'),
(4, 3, 'Nice insights, Dave.'),
(5, 4, 'I can relate to this.'),
(6, 5, 'Now I am hungry.'),
(7, 6, 'Sounds like a fun trip!');
