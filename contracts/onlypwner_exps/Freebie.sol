// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 声明IVault接口用于与Vault合约交互
interface IVault {
    function withdraw(uint256 amount) external;
}

contract Withdrawer {
    address public vaultAddress;

    // 构造函数，设置Vault合约地址
    constructor(address _vaultAddress) {
        vaultAddress = _vaultAddress;
    }

    // 从Vault合约中取款的函数
    function withdrawFromVault(uint256 amount) external {
        IVault(vaultAddress).withdraw(amount);
    }

    // 允许接收ETH的回退函数
    receive() external payable {}

    // 获取合约余额的函数
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // 获取Vault合约余额的函数
    function getVaultBalance() external view returns (uint256) {
        return vaultAddress.balance;
    }

}