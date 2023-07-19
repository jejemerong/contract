//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Token {
    string public name = "Jemerald";
    string public symbol = "JEM";
    uint256 public decimal = 18;

    uint256 public totalSupply = 100000;

    address public owner;
    mapping(address => uint256) balances;

    event Transfer (address indexed _from, address indexed _to, uint256 _value); // address type 에 indexed 를 붙이는 이유는 

    constructor (){
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer (address to, uint256 amount) external{
        require(balances[msg.sender] >= amount); // 잔액 조회

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount); // 리턴 없이 이벤트 로깅만
    }

    function balaneOf(address account) external view returns (uint256){
        return balances[account];
    }
}