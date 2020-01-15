const Migrations = artifacts.require("Migrations");
const Deadquiz = artifacts.require("Deadquiz");
const AssetManagement = artifacts.require("AssetManagement")

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Deadquiz);
  deployer.deploy(AssetManagement);
};
