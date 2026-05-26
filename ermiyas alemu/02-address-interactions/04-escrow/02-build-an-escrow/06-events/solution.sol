// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        if (msg.sender != arbiter) {
            revert();
        }

        uint balance = address(this).balance;
        emit Approved(balance);

        payable(beneficiary).transfer(balance);
    }
}
