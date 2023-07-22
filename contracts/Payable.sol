//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// payable addresses and functions can receive Ether
contract Payable {
    address payable public owner;
    constructor() { // TODO: constructor 는 payable syntax 의 영향을 안받는지 확인
        owner = payable(msg.sender);
    }

    function deposit () external payable {

    }
}