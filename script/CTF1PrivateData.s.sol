// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/CTF1.sol";
import "../src/StringBytes32.sol";

contract AccessPrivateData is Script {
    function getPrivateData(
        uint256 slotNo,
        address targetContract
    ) public view returns (bytes32) {
        bytes32 slotVal = vm.load(targetContract, bytes32(slotNo));

        return slotVal;
    }

    function run() public {

        
        StringBytes32 converter = new StringBytes32();

        string
            memory privateState = "0x68ffc335fd64ad387762ed58477f547ae0f06d4e49e65aabce8956718e1c0a45";

        uint256 privateStateSlot = 1;
        bytes32 password = converter.stringToBytes32(privateState);
        CTF1 ctf = new CTF1(password);

        // Access private data from the target contract
        bytes32 privateData = getPrivateData(privateStateSlot, address(ctf));

        // Convert bytes32 to string and log
        string memory privateDataString = converter.bytes32ToString(
            privateData
        );

        console2.log("Actually Private State: ");
        console2.log(privateState);
        console2.log("Optained Private Value: ");
        console2.log(privateDataString);
    }
}
