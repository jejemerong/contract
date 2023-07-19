//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint public num;

    function set(uint _num) public  {
        num = _num;
    }

    function get() public view  returns (uint){
        return num;
    }
}