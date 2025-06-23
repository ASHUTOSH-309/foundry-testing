// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

import {LockTime} from "../src/LockTime.sol";

contract LockTimeTest is Test{
    LockTime l1;

    function setUp() public {
        l1=new LockTime(12356789236545678938765);
    }



    function testCheckForDifferentTimestamps() public {

        vm.warp(12356789236545678938765);
        l1.unlockTheGift();
        vm.expectRevert();
    }






}