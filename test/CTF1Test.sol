// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {CTF1} from "../src/CTF1.sol";

contract CTF1Test is Test {
    CTF1 public ctf1;
    bytes32 private password;

    function setUp() public {
        ctf1 = new CTF1(password);
    }

    function test_unlock() public {}
}
