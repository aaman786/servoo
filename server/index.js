// Import Paclages
const express = require("express");
const mongoose = require("mongoose");

// other files import
const authRouter = require("./server_routes/auth");
const providerRouter = require("./server_routes/provider");
const userRouter = require("./server_routes/user");

// General Initializaion
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://aaman786:satvilkar@cluster0.7j8n8bj.mongodb.net/?retryWrites=true&w=majority";

mongoose.set("strictQuery", false);

// Middlewares
app.use(express.json()); //mediatory
app.use(providerRouter);
app.use(authRouter);
app.use(userRouter);

// connections To Mongo DB
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection to Mongoose Sucessful");
  })
  .catch((e) =>
    console.log(`The error during connecting to Mongoose is: ${e}`)
  );

// Creating API
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
