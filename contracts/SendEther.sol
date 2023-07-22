//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SendEther {
    // I don't understand that msg.data is empty means
    receive() payable external {}

    function sendViaTransfer(address payable _to) external payable{
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to Send Ether");
    }

    function sendViaCall(address payable _to) external payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed to Send Ether");
    }

    function sendEth (address _to, uint _amount) external payable {
        (bool sent,) = _to.call{value: _amount}(""); // bytes memory data 안쓸거면 비워도 되는지
        require(sent, "Failed to Send Ether");
    }
}