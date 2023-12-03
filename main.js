const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = 3000;

app.use(express.json()); // Middleware to parse JSON requests

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: 'Lilliendalsvej1',
    database: 'cafe_finder',
});


connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL');
});

// Endpoint for all cafes
app.get('/cafes', (req, res) => {
    connection.query(
        'SELECT * FROM cafes',
        function (error, results) {
            res.send(results);
        }
    )
});

// Endpoint for a specific cafe based on cafe_id
app.get('/cafes/:cafeId', (req, res) => {
    const cafeId = req.params.cafeId;

    connection.query(
        `SELECT * FROM cafes WHERE cafe_id= ?`,
        [cafeId],
        function (error, results) {
            res.send(results);
        }
    );
});

// Endpoint for all users
app.get('/users', (req, res) => {
connection.query(
        'SELECT * FROM users',
        function (error, results) {
            res.send(results);
        }
    )
});

// Endpoint for a specific user based on user_id
app.get('/users/:userId', (req, res) => {
    const userId = req.params.userId;

    connection.query(
        'SELECT * FROM users WHERE user_id = ?',
        [userId],
        function (error, results) {
            res.send(results);
        }
    );
});

// Endpoint for filtering cafes based on city
app.get('/cafes/city/:city', (req, res) => {
    const city = req.params.city;

    connection.query(
        'SELECT * FROM cafes WHERE city = ?',
        [city],
        function (error, results) {
            res.send(results);
        }
    );
});

// Endpoint for filtering cafes based on price
app.get('/cafes/price/:price', (req, res) => {
    const price = req.params.price;

    connection.query(
        'SELECT * FROM cafes WHERE prices = ?',
        [price],
        function (error, results) {
            res.send(results);
        }
    );
});

// Endpoint for filtering cafes based on rating
app.get('/cafes/rating/:rating', (req, res) => {
    const rating = req.params.rating;

    connection.query(
        'SELECT * FROM cafes WHERE rating >= ?',
        [rating],
        function (error, results) {
            res.send(results);
        }
    );
});

// Endpoint for see opening hours for a specific cafe
app.get('/cafes/:cafeId/opening_hours', (req, res) => {
    const cafeId = req.params.cafeId;

    connection.query(
        'SELECT * FROM opening_hours WHERE cafe_id = ?',
        [cafeId],
        function (error, results) {
            res.send(results);
        }
    );
});


// Endpoint for filtering cafes based on amenities
app.get('/cafes/amenities/:amenities', (req, res) => {
    const amenities = req.params.amenities;

    connection.query(
        'SELECT * FROM cafes WHERE amenities LIKE ?',
        [`%${amenities}%`],
        function (error, results) {
            res.send(results);
        }
    );
});


// Endpoint for creating a new cafe
    app.post('/create/cafes', (req, res) => {
        const name = req.body.name
        const city = req.body.city
        const location = req.body.location
        const amenities = req.body.amenities
        const prices = req.body.prices
        const rating = req.body.rating;

        connection.query(
        'INSERT INTO cafes (name, city, location, amenities, prices, rating) VALUES (?, ?, ?, ?, ?, ?)',
            [name, city, location, amenities, prices, rating],
        function (error, results) {
            res.send(results);
    });
});


// Endpoint for creating a new user
app.post('/create/users', (req, res) => {
    const username= req.body.username
    const email = req.body.email
    const password = req.body.password;

    connection.query(
        'INSERT INTO `users` (username, email, password) VALUES(?,?,?)',
        [username, email, password],
        function (err, result, fields) {
            res.send(result);
        }
    )
});

// Endpoint for deleting a user
app.delete('/delete/users/:userId', (req, res) => {
    const userId = req.params.userId;

    connection.query(
        'DELETE FROM users WHERE user_id = ?',
        [userId],
        function (error, results) {
            res.send(results);
        }
    );
});


// Endpoint for users favorites
app.post('/users/:userId/favorite/:cafeId', (req, res) => {
    const userId = req.params.userId;
    const cafeId = req.params.cafeId;

    connection.query(
        'INSERT INTO favorites (user_id, cafe_id) VALUES (?, ?)',
        [userId, cafeId],
        function (error, results) {
            res.send(results);
        }
    );
});

//
app.delete('/users/:userId/favorite/:cafeId', (req, res) => {
    const userId = req.params.userId;
    const cafeId = req.params.cafeId;

    connection.query(
        'DELETE FROM favorites WHERE user_id = ? AND cafe_id = ?',
        [userId, cafeId],
        function (error, results) {
            res.send(results);
        }
    );
});

// Endpoint for deleting a cafe
app.delete('/cafes/:cafeId', (req, res) => {
    const cafeId = req.params.cafeId;

    connection.query(
        'DELETE FROM cafes WHERE cafe_id = ?',
        [cafeId],
        function (error, results) {
            res.send(results);
        }
    );
});


app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
