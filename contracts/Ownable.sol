//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner (){
        require(owner == msg.sender, "not owner");
        _;
    }

    function setOwner(address _newAddr) external onlyOwner {
        require(_newAddr != address(0), "New Address is Zero Address!");
        owner = _newAddr;
    }
}