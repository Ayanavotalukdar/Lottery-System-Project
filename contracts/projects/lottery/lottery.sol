// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/projects/lottery/randomNum.sol";

contract lottery 
{
    address payable internal owner;
    address[] internal participants;
    uint256 winnerIndex;
    uint32 obstructor = 0;
    VRFv2Consumer controller;

    constructor(uint64 subId)
    {
        owner = payable(msg.sender);
        controller = new VRFv2Consumer(subId);
    }

    //participants give money to the smartcontract
    function makePayment() public payable
    {
        require(msg.sender != owner,"Owner cannot participate in lottery");
        require(msg.value==5 ether);
        participants.push(msg.sender);
    }

    receive() external payable 
    {
        makePayment();
    }

    //manager withdraw money from the smartcontract
    function manager() public payable ownerOnly
    {
        require(obstructor==1);
        (bool callsuccess,) = owner.call{value:address(this).balance}("");
        require(callsuccess,"Failed to send Ether"); 
        obstructor=0;
    }


    //manager checkbalance of his own account
    function getBalance() public view ownerOnly returns(uint256) 
    {
        return(address(owner).balance);
    }

    //getting randomnumber and deciding winner
    function winner() public returns(address)
    {
        require(participants.length>=10,"Participants number must be minimum 5");
        uint256  randomr = controller.randomNumberGenerator();
        winnerIndex = randomr%(participants.length);
        return participants[winnerIndex];
    }

    //transferring money to winners account
    function prize() public payable 
    {
        require(participants.length>=10,"Participants number must be minimum 5");
        address payable rewardto = payable(winner());
        rewardto.transfer(50 ether);
        obstructor = 1;
    }

    modifier ownerOnly
    {
        require(msg.sender==owner,"Only owner can accsess it");
        _;
    }
}