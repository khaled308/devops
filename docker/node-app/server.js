const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send(`
    <h1>Hello from inside the very basic Node app!</h1>
  `);
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
