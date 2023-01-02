const jwt = require("jsonwebtoken");
const User = require("../schema/userSchema");

const provider = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token,access denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "token verification failed,authorization denied." });

    const user = await User.findById(verified.id);
    if (user.identity == "user" || user.identity == "seller") {
      return res.status(401).json({ msg: "You are not an admin!" });
    }
    req.user = verified.id;
    req.token = token;
    next();
  } catch (e) {
    res.status(500).json({ eror: e.message });
  }
};

module.exports = provider;
