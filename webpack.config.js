const path = require("path");

module.exports = {
  mode: "production",
  module: {
    rules: [
      {
        test: /\.js?$/,
        include: [path.resolve(__dirname, "craft/web/assets/js")],
        loader: "babel-loader"
      }
    ]
  }
};