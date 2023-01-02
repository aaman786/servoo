const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please Enter a Valid Email",
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Please Enter a Password Of Length Above 6 Characters. ",
    },
  },
  phone: {
    type: String,
    default: "",
  },
  address: {
    type: String,
    default: "",
  },
  identity: {
    type: String,
    default: "user",
  },
  //   cart: [
  //     {
  //       product: productSchema,
  //       quantity: {
  //         type: Number,
  //         required: true,
  //       },
  //     },
  //   ],
});

const User = mongoose.model("User", userSchema);
module.exports = User;
