pragma solidity ^0.8.7;

// SPDX-License-Identifier: MIT

contract FeeCollector{
    address public owner;
    uint256 public balance;

    constructor(){
        owner=msg.sender;
    }

    receive() payable external{
        balance +=msg.value;
    }

    function withDraw(uint256 amount,address payable destAddr)public{
        require(msg.sender== owner,"Only can owner withdraw" );
        require(balance<= amount,"insufficient balance");
        destAddr.transfer(amount);
        balance -= amount;

    }

}
