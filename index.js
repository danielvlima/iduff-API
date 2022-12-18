require('dotenv').config();
const { getConnection } = require("./src/database/db_connection");
const name = process.env.DB_NAME


getConnection();