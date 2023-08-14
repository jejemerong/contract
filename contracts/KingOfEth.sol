//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract KingOfEth{
    address payable public king;
    function play () external payable {
        uint bal = address(this).balance - msg.value;

        require(msg.value > bal, "need to pay more to become the king");

        (bool sent, ) = king.call{value: bal}("");
        require(sent, "failed to send ETH");

        king = payable(msg.sender);
    }
}