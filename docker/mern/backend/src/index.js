const express = require("express");
const config = require("./config");
const connectDB = require("./config/db");

const app = express();

app.get("/", (req, res) => {
  res.send("Hello World!, this is a test");
});

app.listen(config.port, () => {
  console.log(`Server listening on port ${config.port}`);
  connectDB();
});
