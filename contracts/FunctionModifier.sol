//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Restrict access
// Validate inputs
// Check states right before and after a function call
contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not Owner");
        _;
    }

    modifier validAddress (address _addr) {
        require(_addr != address(0), "Not Invalid Address");
        _;
    }

    function changeOwner (address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    modifier noReentrancy () {
        require(!locked, "No Entrency");

        locked = true; // 얘는 굳이 왜 붙이는거?
        _;
        locked = false;
    }

    function decrement (uint i) public noReentrancy{
        x -= 1;
        if(i > 1) {
            decrement(i - 1);
        }
    }
}