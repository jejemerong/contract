//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Events {
    event Log(string message, uint val);
    event IndexedLog (address indexed sender, uint val);

    event Message (address _from, address _to, string _message);

    function example () external {
        emit Log("Let's Go~!", 123);
        emit IndexedLog(msg.sender, 100);
    }

    function sendMessage(address _addr, string memory _message) external {  // calldata vs memory gas cost 비교해보기
        emit Message(msg.sender, _addr, _message);
    }
}