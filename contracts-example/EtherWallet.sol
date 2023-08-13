//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract EtherWallet{
    address payable public owner;
    receive() payable external {}
    constructor () {
        owner = payable(msg.sender);
    }

    function withdraw (uint _amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        bool sent = owner.send(_amount); // 82ms
        // (bool sent, ) = owner.call{value: _amount}(""); // 105ms
        require(sent, "Failed to send Ether");
    }
}