//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
    
    function sum (uint[] storage arr) internal view returns (uint) {
        uint num;
        for(uint i = 0; i < arr.length; i++){
            num += arr[i];
        }
        return num;
    }
}

