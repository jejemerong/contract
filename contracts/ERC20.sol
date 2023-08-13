//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract IERC20 {
    // 변수 선언
    address owner;
    uint nowTime;

    // 이벤트 선언
    event transfer (address indexed owner);

    // 초기화
    constructor () {
        owner = msg.sender;
        nowTime = block.timestamp;
    }

    // 함수 정의: internalk -> external 순서로
    function Transfer() external payable{
        emit transfer(msg.sender);
    }

}