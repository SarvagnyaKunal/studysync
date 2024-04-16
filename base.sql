create database studysync;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phno VARCHAR(20) NOT NULL UNIQUE,
    clg_name VARCHAR(100) NOT NULL,
    CHECK (phno REGEXP '^[0-9]+$')
);

CREATE TABLE problems (
    problem_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    topic VARCHAR(100),
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE expertise (
    expertise_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    topic VARCHAR(100),
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
);

CREATE TABLE colleges (
    college_name VARCHAR(100) PRIMARY KEY
);

ALTER TABLE users
ADD CONSTRAINT fk_users_colleges FOREIGN KEY (clg_name) REFERENCES colleges(college_name);

CREATE TABLE study_groups (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    college_name VARCHAR(100),
    subject VARCHAR(100),
    group_name VARCHAR(100),
    FOREIGN KEY (college_name) REFERENCES colleges(college_name)
);