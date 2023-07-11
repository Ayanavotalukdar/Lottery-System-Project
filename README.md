# Lottery-System-Project
It is a lottery smart contract made by using solidity , chain.link and hardhat. This code can be used as a professional lottery system.

# Must read the below instructions

randomNum.sol - this file used to generate a random number. We use the chain.link.
.deps folder - this folder contains the complete owner system and the process of generating random number.
lottery.sol - this is the main controlling file of this project. You can interact with the smart contract through this.

# You must need a wallet for performing any task(e.g.:metamask,coinbase,samsungwallet etc.)
# You must need some amount of ether(2 ether minimum recommended) in your account for using as gas-price.

Requirements:
You must have to pass a subscription id while you deploying the code
At first go to the "https://vrf.chain.link/?_ga=2.118104969.1065109641.1688962259-667354376.1687533919" for creating the subscription id.
Acquire chain.link token for funding the contract "https://faucets.chain.link/?_ga=2.150628534.1065109641.1688962259-667354376.1687533919"
# Now open the contract in "https://remix.ethereum.org/"
After deploying code you have to fund the smartcontract for doing this work.
# After one round of lottery you have to start the whole process again.
# This lottery system uses sepoila-testnetwork as default. you have to change the requestId according to your required network(like..goreli,ethereum mainnet)
# You should test this  before dealing with real money since this complete process contains transactions and if you loose some amount of money you cannot get back.
# You can change the gasPrice limit according to Your need(min 1000000)

Functions:
makePayment(): for getting payment from other accounts
winner(): for getting the public-address of the winning wallet account
prize(): for giving the reward to the winning participant
