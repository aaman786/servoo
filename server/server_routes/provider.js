const express = require("express");
const providerRouter = express.Router();
const provider = require("../midddle_ware/provider_mw");
const Service = require("../schema/serviceSchema");

// ADD Service
providerRouter.post("/provider/add-service", provider, async (req, res) => {
  try {
    const {
      _id,
      spName,
      address,
      title,
      subTitle,
      description,
      note,
      cityName,
      pinCode,
      dateTime,
    } = req.body;

    let service = new Service({
      _id: _id,
      spName,
      address,
      title,
      subTitle,
      description,
      note,
      cityName,
      pinCode,
      dateTime,
    });

    service = await service.save();
    res.json(service);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

providerRouter.get("/provider/added-service", provider, async (req, res) => {
  try {
    const id = req.user;
    // console.log(id);
    const service = await Service.findById(id);

    if (!service) {
      serviceFound = false;
      console.log("Service not found. U didn't add any");
      return res.json(serviceFound);
    }

    // console.log(service);
    res.json(service);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = providerRouter;
