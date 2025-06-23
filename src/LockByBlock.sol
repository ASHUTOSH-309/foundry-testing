// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;




contract LockByBlock {
    uint256 public unlockBlock;
    bool public unlocked;

    constructor(uint256 _unlockBlock) {
        unlockBlock = _unlockBlock;
    }

    function unlock() public {
        require(block.number >= unlockBlock, "Not yet!");
        unlocked = true;
    }
}
