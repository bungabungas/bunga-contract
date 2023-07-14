async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Testing account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    dataContract = await ethers.getContractAt("contract","0x");
  } 
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
    //npx hardhat run scripts/mumbaiFstar.js --network mumbai