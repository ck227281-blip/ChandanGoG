const hre = require("hardhat");

async function main() {
  const Contract = await hre.ethers.getContractFactory("LedgerFall");
  const instance = await Contract.deploy();
  await instance.deployed();

  console.log("LedgerFall deployed to:", instance.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
