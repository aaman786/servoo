const express = require("express");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();
const { json } = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../schema/userSchema");
const auth = require("../midddle_ware/auth_mw");

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password, phone, address, identity } = req.body;

    let existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    existingUser = await User.findOne({ phone });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same phone number already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      name,
      email,
      password: hashedPassword,
      phone,
      address,
      identity,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist." });
    }

    const isMatch = await bcryptjs.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ msg: "Entered password is incorrect." });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// checking the token
authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);

    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// getting user data
// midleware is used here ..auth
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;
