//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Fallback{
    // I don't understand that msg.data is empty means
    receive() payable external {}
    fallback() payable external {}
}