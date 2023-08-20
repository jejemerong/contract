//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract A {
    function foo () public pure virtual returns(string memory) {
        return "A";
    }

    function bar() public pure virtual returns(string memory){
        return "A";
    }
}

contract B is A {
    // 상속 받은 부모 컨트랙트 내의 함수를 사용하기 위해서는 override 명시 필요
    function foo() public pure override virtual returns (string memory){
        return "B";
    }

    function bar () public pure override virtual returns(string memory) {
        return "B";
    }
}

// 아니 근데 B 한테만 상속 받아도 되는 거 아닌가?
// 왜 굳이 A, B 로 상속 받아야 하는 거지?
contract C is A, B {
    // 다른 컨트랙트에서 함수를 상속 받기 위해서는 virtual 명시 필요
    function foo() public pure override virtual (A, B) returns(string memory) {
        return "C";
    }

    function bar() public pure override(A, B) returns(string memory){
        return "C";
    }
}

contract D is B, C {
    function foo() public pure override (B, C) returns(string memory) {
        return super.foo();
    }
}