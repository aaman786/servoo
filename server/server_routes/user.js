const express = require("express");
const userRouter = express.Router();
const auth = require("../midddle_ware/auth_mw");
const Service = require("../schema/serviceSchema");

userRouter.get(
  "/api/service/serach/:cityName/:service",
  auth,
  async (req, res) => {
    try {
      let service = await Service.find({
        cityName: { $regex: req.params.cityName, $options: "i" },
      });

      let gotServices = [];
      service.forEach((element) => {
        // console.log(element["title"]);
        if (element["title"] == req.params.service) {
          gotServices.push(element);
        }
      });

      res.json(gotServices);
    } catch (e) {
      res.statusCode(500).json({ error: e.message });
    }
  }
);

//  /api/service/all-nearby?category=Essentia
userRouter.get("/api/service/all-nearby/", auth, async (req, res) => {
  try {
    console.log(req.query.cityName);
    const services = await Service.find({
      cityName: { $regex: req.query.cityName, $options: "i" },
    });

    res.json(services);
  } catch (e) {
    res.statusCode(500).json({ error: e.message });
  }
});

module.exports = userRouter;
