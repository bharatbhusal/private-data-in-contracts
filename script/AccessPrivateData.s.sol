// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/CTF1.sol";

// import "../src/StringBytes32.sol";
// import "../src/StringAddress.sol";

contract AccessPrivateData is Script {
    function getPrivateData(
        uint256 slotNo,
        address targetContract
    ) public view returns (bytes32) {
        bytes32 slotVal = vm.load(targetContract, bytes32(slotNo));
        console2.logBytes32(slotVal);
        return slotVal;
    }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // StringBytes32 stringBytes32Converter = new StringBytes32();
        // StringAddress stringAddressConverter = new StringAddress();

        uint256 privateStateSlot = 1;
        address contractAddress = 0x89d5b48f3974A05b4BF816aebA12D401c0ebb003;

        bytes32 privateData = getPrivateData(privateStateSlot, contractAddress);

        console2.logBytes32(privateData);
        console2.log("hi");
        vm.stopBroadcast();
    }
}
