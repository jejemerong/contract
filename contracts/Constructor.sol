//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// how to pass the arguments to constructors
contract X {
    string public name;

    constructor (string memory _name){
        name = _name;
    }
}

contract Y {
    string public text;
    constructor (string memory _text) {
        text = _text;
    }
}

contract B is X ("Input is X"), Y("Input is Y") {

}

contract C is X, Y {
    // modifier 조건 추가하는 형식으로 constructor 에 parameter 넘겨줌.
    constructor (string memory _name, string memory _text) X(_name) Y(_text){} 
}

// constructor 호출 순서는 constructor 에서 호출된 순서가 아니라 상속된 순서!!
contract D is X, Y {
    constructor() X("Input is XX") Y("Input is YY"){}
}

contract E is X, Y{
    constructor () Y("Input is YY") X("Input is XX") {}
}