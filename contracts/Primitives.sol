//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Primitives {
    bool public boo = true;

    // the kind of uint suffix is (8, 16, ..., 256)
    // the range is from 0 to 2 ** (8, 16, ..., 256) - 1
    // uint is same as uint256
    uint8 public a = 10;
    uint256 public b = 100;
    uint public c = 100;
    
    // int types allow the negative number
    // the range is from -2 ** (7, 15, ..., 255) to 2 ** (7, 15, ..., 255) - 1
    int public d = -200;

    // the min and max of int type 
    int public min = type(int).min;
    int public max = type(int).max;

    address public addr = 0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199;

    // the default value
    bool public defaultBool; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddress; // 0x0000000000000000000000000000000000000000 0x 뒤에 0 40개가 null 값

    // dynamic bites array
    bytes1 e = 0xb5; // [10110101]
    bytes1 f = 0x56; // [01010110]
}