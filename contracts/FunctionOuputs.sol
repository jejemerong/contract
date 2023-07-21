//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract FunctionOutputs {
    function returnMany () pure public returns(uint, bool) {
        return(1, true);
    }

    function named () pure public returns (uint x, bool y){
        return(1, true);
    }

    function assigned () public pure returns (uint x, bool y) {
        x = 2;
        y = true;
    }

    function destructuringAssigments () public pure  {
        // (uint x, bool y) = returnMany();
        // (, bool z) = returnMany(); // return 값을 굳이 다 받아서 할당할 필요는 없음.
    }

    function myFunc() external view returns(address, bool) {
        return(msg.sender, false);
    }
}