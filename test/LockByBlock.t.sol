// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {LockByBlock} from "../src/LockByBlock.sol";

contract LockByBlockTest is Test{
    LockByBlock l1;
    function setUp() public{
        l1=new LockByBlock(100);// set the unlock block
    }


    function testAttemptBeforeBlockisMined() public{
        vm.roll(50); // currently only 50 blocks aremined in the chain
        vm.expectRevert();
        l1.unlock();
    }

    function testAttemptAfterBlockisMined() public{
        vm.roll(200);
        l1.unlock();
        assertEq(l1.unlocked(),true,"ok");
    }

}