//var CVExtenderLib = artifacts.require("./CVExtender.sol");
var CV = artifacts.require("./CV.sol");


module.exports = function(deployer) {
 // deployer.deploy(CVExtenderLib);
 // deployer.link(CVExtenderLib, CV);
  deployer.deploy(CV);

};
