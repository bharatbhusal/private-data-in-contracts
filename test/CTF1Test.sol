// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {CTF1} from "../src/CTF1.sol";

contract CounterTest is Test {
    CTF1 public counter;

    function setUp() public {
        bytes32 password;
        counter = new CTF1(password);
    }

    function test_unlock() public {}
}
