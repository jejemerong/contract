//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./ArrayLib.sol";

contract TestArray {
    using ArrayLib for uint[];

    uint[] public arr = [3, 2, 1];

    function testFind() external view {
        arr.find(2);
    }

    function testSum() external view returns(uint){
        return arr.sum();
    }
}