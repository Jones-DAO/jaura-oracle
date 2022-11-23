// SPDX-License-Identifier: GPL-3.0-only

pragma solidity ^0.8.13;

/**
 * @title Jones Aura Rate Provider
 */
interface IRateProvider {
    function getRate() external view returns (uint256);
}

interface IJonesAura {
    function convertToAssets(uint256 shares)
        external
        view
        returns (uint256 assets);
}

contract JonesAuraRateProvider is IRateProvider {
    IJonesAura public immutable jonesAuraToken;

    constructor(IJonesAura _jonesAuraToken) {
        jonesAuraToken = _jonesAuraToken;
    }

    // returns AURA value of 1 jAURA
    function getRate() external view override returns (uint256) {
        return jonesAuraToken.convertToAssets(1 ether);
    }
}
