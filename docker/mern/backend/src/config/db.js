const mongoose = require("mongoose");
const config = require("./index");

module.exports = async function connectDB() {
  mongoose
    .connect(config.mongo_url)
    .then(() => {
      console.log("Connected to MongoDB");
    })
    .catch((err) => {
      console.log("Failed to connect to MongoDB", err);
    });
};
