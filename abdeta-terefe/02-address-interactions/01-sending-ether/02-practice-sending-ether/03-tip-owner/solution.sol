// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function tip() external payable {
        (bool sent, ) = owner.call{value: msg.value}("");
        require(sent);
    }
}
