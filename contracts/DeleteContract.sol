//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

// delete contract forever from the blockchain
contract Kill {
    function kill() external {
        selfdestruct(payable(msg.sender)); // that function needs payable address
    }
}
