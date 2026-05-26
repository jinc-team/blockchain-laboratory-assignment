// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// Only import Hero.sol for this milestone
import "./Hero.sol";

// 1. Pass 200 into the base Hero constructor for Warrior
contract Warrior is Hero(200) {

}

// 2. Pass 50 into the base Hero constructor for Mage
contract Mage is Hero(50) {

}