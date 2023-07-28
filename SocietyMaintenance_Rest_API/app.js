require("dotenv").config();
const express = require("express");
const premiseRoutes = require("./src/routes/premise.route");
const memberRoutes = require("./src/routes/member.route");
const renterRoutes = require("./src/routes/renter.route");
const ledgerRoutes = require("./src/routes/ledger.route");

const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use("/premise", premiseRoutes);
app.use("/member", memberRoutes);
app.use("/renter", renterRoutes);
app.use("/ledger", ledgerRoutes);

app.get("/", (req, res) => {
  res.send("Welcome to society maintenance system");
});

app.use((error, req, res, next) => {
  res.status(500).json({
    message: "Something went wrong",
    error,
  });
});

module.exports = app;
