//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DataLocations {
    uint public x;
    uint public arr;

    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples () external returns (uint[] memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "baz";

        uint[] memory memArr = new uint[](3);
        memArr[1] = 123;
        return memArr;
    }

    function set (address _addr, string calldata _text) external {
        MyStruct storage myStruct = myStructs[_addr]; // TODO: 18번줄과 어떻게 다른 의미를 가지는지
        myStruct.text = _text;
        //  myStructs[_addr] = _text; // 원래 내가 생각한 솔루션
    }

    function get(address _addr )external view returns(string memory){
        return myStructs[_addr].text;
    }
}