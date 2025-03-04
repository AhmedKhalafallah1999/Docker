const express = require("express");
const port = 4000;
const app = express();

app.get("/", (req, res) => res.send("<h1>Hi</h1>"));

app.listen(port, () => {
  console.log(`server is running at ${port}`);
});
