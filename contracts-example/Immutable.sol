//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Immutable {
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    // that MY_ADDRESS and MY_UINT are assigned at the time to call the constructor and can't be modified
    constructor(uint _myInt){
        MY_ADDRESS = msg.sender;
        MY_UINT = _myInt;
    }
}