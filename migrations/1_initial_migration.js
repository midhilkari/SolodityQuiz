const Migrations = artifacts.require("Migrations");
const Deadquiz = artifacts.require("Deadquiz");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Deadquiz);
};
