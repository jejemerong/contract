// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./TestCall.sol";

contract Call {
    function callFoo(address payable _addr) external payable {
        // You can send ether and specify a custom gas amount
        // returns 2 outputs (bool, bytes)
        // bool - whether function executed successfully or not (there was an error)
        // bytes - any output returned from calling the function
        (bool success, bytes memory data) = _addr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        require(success, "tx failed");
    }

    // Calling a function that does not exist triggers the fallback function, if it exists.
    function callDoesNotExist(address _addr) external {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );
    }

    // function callBar(address _addr) external {
    //     // 함수 시그니처는 문자열 인자로 표현되는데 이때, 함수 이름과 타입 정보 외에 공백이 포함되면 안됨!!
    //     // -> 아니 그러면 compile 할 때, 좀 말이라도 해줘야 하는거 아님???ㅋㅋㅋㅋㅋ
    //     (bool _b, ) = _addr.call(abi.encodeWithSignature("bar(uint256,bool)", 123, true));
    //     require(_b, "failed");
    // }
    function callBar(address _addr) external {
        (bool _b, ) = _addr.call(abi.encodeWithSignature("bar(uint256,bool)", 123, true));
        require(_b, "tx failed");
    }
}
