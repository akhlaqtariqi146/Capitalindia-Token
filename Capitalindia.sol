// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Capitalindia is ERC20Capped, ERC20Burnable, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1460000000 * 10  18;
    uint256 public constant AIRDROP_SUPPLY = 292000000 * 10  18;

    uint256 public tradingStartTimestamp;
    bool public tradingStarted = false;

    mapping(address => bool) public hasClaimed;
    mapping(address => uint256) public airdropReceived;
    mapping(address => uint256) public airdropLockUntil;
    mapping(address => uint256) public referralCount;

    constructor() 
        ERC20("Capitalindia", "DHL") 
        ERC20Capped(INITIAL_SUPPLY) 
        Ownable(msg.sender)
    {
        _mint(msg.sender, INITIAL_SUPPLY - AIRDROP_SUPPLY); // 80% to owner
        _mint(address(this), AIRDROP_SUPPLY); // 20% to contract for airdrops/referrals
    }

    function startTrading() external onlyOwner {
        require(!tradingStarted, "Trading already started");
        tradingStartTimestamp = block.timestamp;
        tradingStarted = true;
    }

    function claimAirdropFromBackend(
        address user,
        uint256 rewardAmount,
        address referrer
    ) external onlyOwner {
        require(!hasClaimed[user], "Already claimed");
        require(tradingStarted, "Trading not started");
        require(balanceOf(address(this)) >= rewardAmount, "Not enough tokens in airdrop pool");

        _transfer(address(this), user, rewardAmount);
        airdropReceived[user] = rewardAmount;
        airdropLockUntil[user] = tradingStartTimestamp + 60 days;
        hasClaimed[user] = true;

        if (referrer != address(0) && referrer != user) {
            require(balanceOf(address(this)) >= rewardAmount, "Not enough tokens for referral bonus");
            _transfer(address(this), referrer, rewardAmount);
            airdropReceived[referrer] += rewardAmount;
            airdropLockUntil[referrer] = tradingStartTimestamp + 60 days;
            referralCount[referrer]++;
        }
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Capped)
    {
        if (from != address(0) && airdropReceived[from] > 0) {
            require(
                block.timestamp >= airdropLockUntil[from],
                "Airdropped tokens are locked"
            );
        }

        super._update(from, to, value);
    }
}
