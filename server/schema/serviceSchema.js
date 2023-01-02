const mongoose = require("mongoose");

const serviceSchema = mongoose.Schema({
  spName: {
    type: String,
    required: true,
    trim: true,
  },
  address: {
    type: String,
    required: true,
    trim: true,
  },
  title: {
    type: String,
    required: true,
    trim: true,
  },
  subTitle: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  note: {
    type: String,
    required: true,
    trim: true,
  },
  cityName: {
    type: String,
    required: true,
    trim: true,
  },
  pinCode: {
    type: String,
    required: true,
    trim: true,
  },
  dateTime: {
    type: String,
    required: true,
  },
});

const Service = mongoose.model("Service", serviceSchema);
module.exports = Service;
