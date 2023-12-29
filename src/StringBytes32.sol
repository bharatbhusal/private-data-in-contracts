//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringBytes32 {
    mapping(bytes32 => string) private reverseMapping;

    function stringToBytes32(string memory s) public returns (bytes32) {
        bytes32 hash = keccak256(abi.encodePacked(s));
        reverseMapping[hash] = s;
        return hash;
    }

    function bytes32ToString(bytes32 hash) public view returns (string memory) {
        return reverseMapping[hash];
    }
}
