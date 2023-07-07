const { createCanvas } = require("canvas");

exports.handler = async (event) => {
  var ctx = createCanvas(200, 200).getContext("2d");

  const response = {
    statusCode: 200,
    body: JSON.stringify("Hello from Lambda!"),
  };
  return response;
};
