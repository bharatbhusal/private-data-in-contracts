// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringAddress {
    function stringToAddress(string memory s) public pure returns (address) {
        require(bytes(s).length == 40, "Invalid address length");

        // Use typecast to convert the hexadecimal string to an address
        return address(uint160(uint256(keccak256(abi.encodePacked(s)))));
    }

    function addressToString(
        address _address
    ) public pure returns (string memory) {
        // Convert the address to a uint256 and then to a hexadecimal string
        uint256 addr = uint256(uint160(_address));
        bytes memory buffer = new bytes(40);

        for (uint256 i = 0; i < 20; i++) {
            buffer[i * 2] = bytes1(
                uint8((addr / (2 ** (8 * (19 - i)))) & 0xFF)
            );
            buffer[i * 2 + 1] = bytes1(
                uint8(((addr / (2 ** (8 * (19 - i)))) >> 4) & 0xFF)
            );
        }

        return string(buffer);
    }
}
