//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract UpgradableWallet {
    address public implementation;
    address public owner;

    constructor(address _implementation) {
        implementation = _implementation; // 
        owner = msg.sender; // 요 원본 월렛 컨트랙트를 배포할 시, 호출자가 msg.sender 즉, owner
    }

    fallback() external payable {
        (bool excuted, ) = implementation.delegatecall(msg.data);
        require(excuted, "failed");
    }
}

contract WalletImplementation {
    address public implementation;
    address payable public owner;

    modifier onlyOwner (){
        require(msg.sender == owner, "not owner");
        _;
    }

    receive() external payable{}

    function setImplementation(address _implementation) external {
        implementation = _implementation;
    }

    function withdraw() external onlyOwner {
        owner.transfer(address(this).balance);
    }
}