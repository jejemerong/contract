//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Variables {
    // local variables isn't stored on the blockchain, just declared inside the function 
    // state variables is stored on the blockchain 
    // global variables are about the blockchain information 
    string public text = "this is state variable";
    uint public num = 16;
    
    function doSomething() view public {
        uint256 i = 25; // this is local variable
        
        // this is global variables
        uint timestamp = block.timestamp; 
        address sender = msg.sender;
    }
}