--------------------------------------------------------------------------------
-- POPULATING TABLES
--------------------------------------------------------------------------------
\c qdmedia_db

INSERT INTO Users (user_name, user_email, user_type, user_passw) VALUES
('Alice Johnson', 'alice@example.com', 1, 'password123'),
('Bob Smith', 'bob@example.com', 2, 'password456'),
('Carol Williams', 'carol@example.com', 1, 'password789'),
('Dave Brown', 'dave@example.com', 2, 'password101'),
('Eve Davis', 'eve@example.com', 1, 'password102');

INSERT INTO Posts (user_id, title, post_description, views, likes, dislikes) VALUES
(1, 'Post 1 by Alice', 'Description for Post 1 by Alice', 100, 10, 1),
(1, 'Post 2 by Alice', 'Description for Post 2 by Alice', 150, 15, 2),
(2, 'Post 1 by Bob', 'Description for Post 1 by Bob', 200, 20, 3),
(2, 'Post 2 by Bob', 'Description for Post 2 by Bob', 250, 25, 4),
(3, 'Post 1 by Carol', 'Description for Post 1 by Carol', 300, 30, 5),
(3, 'Post 2 by Carol', 'Description for Post 2 by Carol', 350, 35, 6),
(4, 'Post 1 by Dave', 'Description for Post 1 by Dave', 400, 40, 7),
(4, 'Post 2 by Dave', 'Description for Post 2 by Dave', 450, 45, 8),
(5, 'Post 1 by Eve', 'Description for Post 1 by Eve', 500, 50, 9),
(5, 'Post 2 by Eve', 'Description for Post 2 by Eve', 550, 55, 10),
(1, 'Post 3 by Alice', 'Description for Post 3 by Alice', 600, 60, 11),
(2, 'Post 3 by Bob', 'Description for Post 3 by Bob', 650, 65, 12),
(3, 'Post 3 by Carol', 'Description for Post 3 by Carol', 700, 70, 13),
(4, 'Post 3 by Dave', 'Description for Post 3 by Dave', 750, 75, 14),
(5, 'Post 3 by Eve', 'Description for Post 3 by Eve', 800, 80, 15);

INSERT INTO Comments (user_id, post_id, post_owner_id, comment_description, comment_status) VALUES
(1, 1, 1, 'Comment 1 by Alice on Post 1 by Alice', 'approved'),
(1, 2, 1, 'Comment 2 by Alice on Post 2 by Alice', 'approved'),
(2, 3, 2, 'Comment 1 by Bob on Post 1 by Bob', 'approved'),
(2, 4, 2, 'Comment 2 by Bob on Post 2 by Bob', 'approved'),
(3, 5, 3, 'Comment 1 by Carol on Post 1 by Carol', 'approved'),
(3, 6, 3, 'Comment 2 by Carol on Post 2 by Carol', 'approved'),
(4, 7, 4, 'Comment 1 by Dave on Post 1 by Dave', 'approved'),
(4, 8, 4, 'Comment 2 by Dave on Post 2 by Dave', 'approved'),
(5, 9, 5, 'Comment 1 by Eve on Post 1 by Eve', 'approved'),
(5, 10, 5, 'Comment 2 by Eve on Post 2 by Eve', 'approved'),
(1, 11, 1, 'Comment 3 by Alice on Post 3 by Alice', 'approved'),
(2, 12, 2, 'Comment 3 by Bob on Post 3 by Bob', 'approved'),
(3, 13, 3, 'Comment 3 by Carol on Post 3 by Carol', 'approved'),
(4, 14, 4, 'Comment 3 by Dave on Post 3 by Dave', 'approved'),
(5, 15, 5, 'Comment 3 by Eve on Post 3 by Eve', 'approved'),
(1, 3, 2, 'Comment 1 by Alice on Post 1 by Bob', 'approved'),
(2, 5, 3, 'Comment 1 by Bob on Post 1 by Carol', 'approved'),
(3, 7, 4, 'Comment 1 by Carol on Post 1 by Dave', 'approved'),
(4, 9, 5, 'Comment 1 by Dave on Post 1 by Eve', 'approved'),
(5, 1, 1, 'Comment 1 by Eve on Post 1 by Alice', 'approved'),
(1, 4, 2, 'Comment 2 by Alice on Post 2 by Bob', 'approved'),
(2, 6, 3, 'Comment 2 by Bob on Post 2 by Carol', 'approved'),
(3, 8, 4, 'Comment 2 by Carol on Post 2 by Dave', 'approved'),
(4, 10, 5, 'Comment 2 by Dave on Post 2 by Eve', 'approved'),
(5, 2, 1, 'Comment 2 by Eve on Post 2 by Alice', 'approved');
