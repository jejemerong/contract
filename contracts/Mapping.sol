//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function example() external {
        balances[msg.sender] = 123;

        // uint bal = balances[msg.sender];

        balances[msg.sender] += 456;

        delete balances[msg.sender];

        isFriend[msg.sender][address(this)] = true;
    }
    
    function get (address _addr) external view returns(uint) {
        return balances[_addr];
    }

    function set(address _addr, uint _val) external {
        balances[_addr] = _val;
    }

    function remove (address _addr) external {
        delete balances[_addr];
    }
}