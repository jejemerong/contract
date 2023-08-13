//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Enum {
    enum Status {
        None, // 0
        Pending, // 1
        Shipped, // 2
        Completed, // 3
        Rejected, // 4
        Canceled // 5
    }

    Status public status;

    function get () external view returns(Status) {
        return status; // what is the default status?
    }

    function set(Status _status) external {
        status = _status;
    }

    function cancel () external {
        status = Status.Canceled;
    }

    function reset() external {
        delete status;
    }

    function ship () external {
        status = Status.Shipped;
    }

}