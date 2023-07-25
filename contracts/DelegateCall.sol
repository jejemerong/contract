//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars (address _test, uint _num) external payable {
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "tx failed");
    }

    function setNum(address _test, uint _num) external {
        (bool success, ) = _test.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
        require(success, "tx failed");
    }
}