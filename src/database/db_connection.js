const { Sequelize } = require('sequelize');
const { get } = require('./db');


const name = process.env.DB_NAME
const dialect = process.env.DB_DIALECT
const host = process.env.DB_HOST
const password = process.env.DB_PWD
const port = process.env.DB_PORT
const username = process.env.DB_USER

const getConnection = async () => {
    try {
        
        const connection = new Sequelize(
            name,
            username,
            password,
            {
                host: host,
                port: port,
                dialect: dialect
            });
            await connection.authenticate();
            console.log("Connection has been established successfully.")
            return connection;
        } catch (error) {
            console.log("Unable to connect to the database:", error.message);
        }
    }

module.exports = {
    getConnection
}