const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'AdminDif',
    password: 'EcabLUgdwUd71Lw',
    database: 'Life_Up_DB'
});

connection.connect((error) => {
  if (error) {
    console.error('Error al conectar a la base de datos:', error);
  } else {
    //console.log('Conexión exitosa a la base de datos');
  }
});

//CREATE USER 'AdministratorDif'@'localhost' IDENTIFIED BY 'i4zaupBciycFX7gY';
//sudo mariadb -u AdministratorDif -p
module.exports = connection;
