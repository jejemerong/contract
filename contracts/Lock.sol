// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Lock {
    uint public unlockTime;
    address payable public owner;

    event Withdrawal(uint amount, uint when); // 언락 후 출금 이벤트 기록

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    // 출금
    function withdraw() public {

        require(block.timestamp >= unlockTime, "You can't withdraw yet");
        require(msg.sender == owner, "You aren't the owner");

        emit Withdrawal(address(this).balance, block.timestamp); // address(this) 해당 주소 객체

        owner.transfer(address(this).balance);
    }
}
