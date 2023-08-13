//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// When an array element is removed using the delete operator, it does not shrink the array length
// this leaves the gap in the array. 
// this a technique to shrink after removing the array an element. 
contract ArrayShift {
    uint[] public arr = [1, 2, 3];

    function remove(uint _index) external {
        require(_index < arr.length, "index out of bound"); // error handling
        delete arr[_index]; //굳이 안해도 됨. arr[i] = arr[i+1] 에 포함
        for(uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }
}
