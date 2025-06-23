// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

import {LockTime} from "../src/LockTime.sol";

contract LockTimeTest is Test{
    LockTime l1;
    uint256 BeforeTime;
    uint256 AfterTime;

    function setUp() public {
        l1=new LockTime(100);
        BeforeTime=50;
        AfterTime=200;
    }

    function testAdminBeforeTime()public{        
        vm.warp(BeforeTime);
        vm.expectRevert();
        l1.unlockTheGift();
    }
// only in this scemario the admin should be able to unlock the gift
    function testAdminAfterTime() public {
        vm.warp(AfterTime);
        l1.unlockTheGift();
        assertEq(l1.unlock(),true, "ok");
    }


    function testNonAdminBeforeTime() public{
            vm.warp(BeforeTime);
            vm.prank(0x388c0e176cC68b3f4020C38116ae9044DC2cafF8);
            vm.expectRevert();
            l1.unlockTheGift();
    }

    function testNonAdminAfterTime() public{    
           vm.warp(AfterTime);
           vm.prank(0x388c0e176cC68b3f4020C38116ae9044DC2cafF8);
           vm.expectRevert();
           l1.unlockTheGift();
    }

}