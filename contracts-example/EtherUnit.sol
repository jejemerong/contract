//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract EtherUnit{
    uint public oneWei = 1 wei;
    bool isOneWei = 1 wei == 1; // 1 wei is equal to 1

    uint public oneEther = 1 ether;
    bool isOneEther = 1 ether == 1e18; // 1 ether is equal to 10^18
}