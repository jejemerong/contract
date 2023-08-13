// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    receive() payable external {
        emit Deposit(msg.value);
    }
    
    function withdraw () external {
        require(msg.sender == owner, "only owner can withdraw");
        emit Withdraw(address(this).balance); // address(this) => CA
        selfdestruct(payable(msg.sender)); // 굳이 send 안해도 어차피 msg.sender 한테 다 잔액 전송됨. 
    }
}
