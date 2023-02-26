import { ethers } from "hardhat";

async function main() {
  // const BAYCADDRESS = "0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D"

  const BAYCSTAKING = await ethers.getContractFactory("BAYCStaking");
  const Baycstaking = await BAYCSTAKING.deploy("BAYCStaking", "BAYCS");
  await Baycstaking.deployed();

  console.log(`BAYC Staking contract deployed at address: ${Baycstaking.address}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
