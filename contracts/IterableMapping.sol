//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Mapping is not iterable in Solidity.
contract IterableMapping {
    mapping (address => uint) public balances;
    mapping (address => bool) public inserted;

    address[] public keys;
    
    modifier isEmpty () {
        require(keys.length != 0);
        _;
    }

    function set (address _addr, uint _bal) external {
        balances[_addr] = _bal;
        if(!inserted[_addr]) {
            inserted[_addr] = true;
            keys.push(_addr);
        }
    }

    function get (uint _index) external view returns(uint) {
        address key = keys[_index];
        return balances[key];
    }

    function first() external view isEmpty returns(uint) {
        return balances[keys[0]];
    }

    function last() external view isEmpty returns (uint) {
        return balances[keys[keys.length - 1]];
    }
}