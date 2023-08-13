//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Math.sol";

contract TestMath {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }

    function testMin(uint x, uint y) external pure returns (uint) {
        return Math.min(x, y);
    }
}
