const path = require("path");

module.exports = {
  mode: "production",
  output: {
    filename: "scripts.min.js"
  },
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
