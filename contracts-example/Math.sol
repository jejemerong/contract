// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
    
    function min(uint x, uint y) internal pure returns(uint) {
        return x <= y ? x : y;
    }
}
