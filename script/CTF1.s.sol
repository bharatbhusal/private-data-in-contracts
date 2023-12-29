// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/CTF1.sol";

contract MyScript is Script {
    function getPrivateData(
        uint256 slotNo,
        address targetContract
    ) public view returns (bytes32) {
        // Load the start slot from storage
        bytes32 slotVal = vm.load(targetContract, bytes32(slotNo));

        return slotVal;
    }

    function bytes32ToHex(bytes32 data) public pure returns (string memory) {
        bytes memory hexString = new bytes(64);

        for (uint256 i = 0; i < 32; i++) {
            uint8 byteValue = uint8(data[i]);
            hexString[i * 2] = toHexChar(byteValue / 16);
            hexString[i * 2 + 1] = toHexChar(byteValue % 16);
        }

        return string(hexString);
    }

    function toHexChar(uint8 value) internal pure returns (bytes1) {
        if (value < 10) {
            return bytes1(uint8(bytes1("0")) + value);
        } else {
            return bytes1(uint8(bytes1("a")) + (value - 10));
        }
    }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        bytes32 password = bytes32("0xf39Fd6e5a8827279cfFb9226676543");
        CTF1 ctf = new CTF1(password);
        console2.log(bytes32ToHex(getPrivateData(1, address(ctf))));
        vm.stopBroadcast();
    }
}
