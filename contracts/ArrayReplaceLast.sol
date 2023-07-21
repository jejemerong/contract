//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// 근데 이 방법은 shifting the array 보다는 gas efficient 이긴 하지만 
// array 의 순서가 보장되지 않는다. 
contract ArrayReplaceLast {
    uint[] public arr = [1, 2, 3, 4];

    function remove(uint _index) external {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }
}