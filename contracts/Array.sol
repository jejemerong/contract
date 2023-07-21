//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    uint[3] public fixedArr; 

    function example () external {
        arr.push(1);
        console.log(arr[0]);
        uint first = arr[0];
        arr[0] = 123;

        delete arr[0];
        arr.push(1);
        arr.push(2);

        arr.pop();

        uint len = arr.length;

        uint[] memory a = new uint[](3);
        a[0] = 1;
        for(uint i = 0; i < arr.length; i++){
            console.log(arr[i]);
        }
        console.log('first: ', first);
        console.log('len: ', len);
    }
}