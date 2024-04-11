const connection = require('../../SQL_CONECTION');
const { v4: uuidv4 } = require('uuid');

// Generate a unique ID
function UID() {
    // Implementation of unique ID generation logic
    // You can use a library like uuid or generate your own unique ID logic
    // Here's an example using uuid library
    return uuidv4();
}



// Insert a new user
function insertUser(req, res, Data) {
    Data.UserID = UID();
    const query = 'INSERT INTO Users (UserID, Email, Password, Rol, ID_Centro) VALUES (?, ?, ?, ?, ?)';
    const values = [Data.UserID, Data.Email, Data.Password, Data.Rol, Data.ID_Centro];
    //console.log(values);
    return new Promise((resolve, reject) => {
        connection.query(query, values, (error, results) => {
            if (error) {
                reject(error);
            } else {

                resolve(results);
                req.send({
                    UserID: Data.UserID               
                });
            }
        });
    });
}

// Update an existing user
function updateUser(req, res, user) {
    const query = 'UPDATE Users SET Email = ?, Password = ?, Rol = ?, ID_Centro = ? WHERE UserID = ?';
    const values = [user.Email, user.Password, user.Rol, user.ID_Centro, user.UserID];

    return new Promise((resolve, reject) => {
        connection.query(query, values, (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results);
                res.send({Message: 'User updated'});
            }
        });
    });
}

// Delete a user
function deleteUser(req, res, userID) {
    const query = 'DELETE FROM Users WHERE UserID = ?';

    return new Promise((resolve, reject) => {
        connection.query(query, userID, (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results);
                res.send({Message: 'User deleted'});
            }
        });
    });
}

// Get all users
function getAllUsers(req, res, ID_Centro) {
    const query = 'SELECT * FROM Users WHERE ID_Centro = ?';
    const values = [ID_Centro];

    return new Promise((resolve, reject) => {
        connection.query(query, values, (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results);
                res.send(results);
            }
        });
    });
}

//////////////////////////////////////////- InformationPersonal


module.exports = {
    insertUser,
    updateUser,
    deleteUser,
    getAllUsers
};