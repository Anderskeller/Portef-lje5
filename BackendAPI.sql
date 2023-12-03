
-- creates table for cafes
CREATE TABLE cafes (
cafe_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
city VARCHAR(255),
location VARCHAR(255),
amenities VARCHAR(255),
prices enum('Budget-friendly', 'Moderately expensive', 'Expensive'),
Rating DECIMAL(5, 1)
);

-- creates table for users
CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL
);

-- creates table for favorite cafes
CREATE TABLE favorites (
user_id int,
cafe_id int,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id)
);

-- creates table for opening hours
CREATE TABLE opening_hours (
    opening_hours_id INT PRIMARY KEY AUTO_INCREMENT,
    cafe_id INT,
    day_of_week enum('Weekday', 'Weekend') NOT NULL,
    open_time TIME NOT NULL,
    close_time TIME NOT NULL,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id)
);

/* Insert data into 'cafes' table */
-- Real cafes in Aarhus, Odense and Copenhagen
INSERT INTO cafes (name, city, location, amenities, prices, rating)
VALUES
('Paludan Cafe', 'København', 'Fiolstræde 10', 'WiFi, Outdoor Seating', 'Moderately expensive', 4.5),
('Bastard Cafe', 'København', 'Rådhusstræde 13', 'Spil, wifi', 'Budget-friendly', 4.7),
('Mad & Kaffe', 'København', 'Sønder Boulevard ', 'Mad, kaffe', 'Budget-friendly', 4.5),
('Cafe Castro', 'København', 'Nørrebrogade 209', 'Mad, drikke', 'Moderately expensive', 3.7),
('Cafe Mauritz', 'Odense', '96 Skibhusvej', 'Mad, Drikke', 'Moderately expensive', 4.7),
('Lagkagehuset', 'Odense', 'Vestergade 1', 'Weinerbrød, Wifi, Kaffe', 'Expensive', 4.1),
('Cafe A', 'Odense', 'Ørbækvej 75', 'drikke, frokost Menu', 'Budget-friendly', 3.0),
('Cafe Aarhus', 'Aarhus', 'Nørre Allé 18', 'Mad, drikke', 'Moderately expensive', 3.7),
('Cafe FolkeVen', 'Aarhus', 'Thorvaldsensgade 17', 'Mad, Drikke', 'Moderately expensive', 4.7),
('Den Gule Cafe', 'Aarhus', 'Jægergårdsgade 2A', 'Weinerbrød, Wifi, Kaffe', 'Expensive', 4.1),
('Plantecafeen', 'Aarhus', 'Kjeld Tolstrups Gade 12', 'drikke, frokost Menu', 'Moderately expensive', 3.0);


/* Insert data into 'users' table */
-- Randomized users
INSERT INTO users (user_id, username, email, password)
VALUES
(1, 'john_doe', 'john.doe@example.com', 'hashed_password_1'),
(2, 'jane_smith', 'jane.smith@example.com', 'hashed_password_2'),
(3, 'bob_jackson', 'bob.jackson@example.com', 'hashed_password_3'),
(4, 'alice_green', 'alice.green@example.com', 'hashed_password_4'),
(5, 'charlie_brown', 'charlie.brown@example.com', 'hashed_password_5'),
(6, 'emma_white', 'emma.white@example.com', 'hashed_password_6'),
(7, 'david_lee', 'david.lee@example.com', 'hashed_password_7');



-- Insert data into 'favorites' table
-- randomized names
INSERT INTO favorites (user_id, cafe_id)
VALUES
(1, 1), -- John Doe likes Paludan Cafe
(2, 2), -- Jane Smith likes Bastard Cafe
(3, 3), -- Bob Jackson likes Mad & Kaffe
(4, 4), -- Alice Green likes Cafe Castro
(5, 5), -- Charlie Brown likes Cafe Mauritz
(6, 6), -- Emma White likes Lagkagehuset
(7, 7); -- David Lee likes Cafe A


/* Insert data into 'opening_hours' table */
-- Randomized opening hours
INSERT INTO opening_hours (cafe_id, day_of_week, open_time, close_time)
VALUES
-- Cafe 1 (Weekdays: 8 AM - 6 PM, Weekends: 9 AM - 5 PM)
(1, 'Weekday', '08:00:00', '18:00:00'),
(1, 'Weekend', '09:00:00', '17:00:00'),

-- Cafe 2 (Weekdays: 7:30 AM - 5:30 PM, Weekends: 10 AM - 4 PM)
(2, 'Weekday', '07:30:00', '17:30:00'),
(2, 'Weekend', '10:00:00', '16:00:00'),

-- Cafe 3 (Weekdays: 9 AM - 8 PM, Weekends: 10:30 AM - 6 PM)
(3, 'Weekday', '09:00:00', '20:00:00'),
(3, 'Weekend', '10:30:00', '18:00:00'),

-- Cafe 4 (Weekdays: 7 AM - 5 PM, Weekends: 10:30 AM - 4 PM)
(4, 'Weekday', '07:00:00', '17:00:00'),
(4, 'Weekend', '10:30:00', '16:00:00'),

-- Cafe 5 (Weekdays: 8:30 AM - 7 PM, Weekends: 9:30 AM - 5:30 PM)
(5, 'Weekday', '08:30:00', '19:00:00'),
(5, 'Weekend', '09:30:00', '17:30:00');
