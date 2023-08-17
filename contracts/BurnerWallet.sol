//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract BurnerWallet {
    address public implementation;
    address payable public owner;

    constructor(address _implementation) {
        implementation = _implementation;
        owner = payable(msg.sender);
    }

    fallback() external payable{
        (bool executed, ) = implementation.delegateCall(msg.data);
        require(executed, "failed");
    }

    function kill () external {
        require(msg.sender == owner, "Not Owner");
        selfdestruct(owner);
    }
}

contract BurnerWalletImplementation {
    address public implementation;
    uint public limit;
    address payable public owner;

    receive() external payable {}

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function setWithdrawLimit(uint _limit) external {
        limit = _limit;
    }

    function withdraw () external onlyOwner {
        uint amount = address(this).balance;
        if(amount > limit){
            amount = limit;
        }
        owner.transfer(amount);
    }
}