// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Modifier{

    uint balance;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require (owner == msg.sender,"only owner can access");
        _;
    }

    function setBalance (uint _balance) public onlyOwner {
        balance = _balance;
    }

    function get() public view onlyOwner returns (uint) {
        if (balance <= 0) {
            revert ("Balance must be greater than 0!");
        } else {
            return balance;
        }
    } 

    function checkInput()public view onlyOwner () {
        assert(balance>0);
    }


}