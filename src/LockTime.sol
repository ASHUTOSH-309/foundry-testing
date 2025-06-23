// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract LockTime{
    
    address public owner;
    uint256 public unlocktime;
    bool public unlock;


    constructor(uint256 _locktime){
        owner=msg.sender;
        unlocktime= _locktime;
    }

    function unlockTheGift() public {
            require(msg.sender==owner,"Don't impersonate to be the owner");
            require(block.timestamp > unlocktime,"it is still locked mr owner");
            unlock=true;
    }

}
