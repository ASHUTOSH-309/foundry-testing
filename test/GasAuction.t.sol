// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {GasAuction} from "../src/GasAuction.sol";




contract GasAuctionTest is Test{
    GasAuction g1;

    function setUp() public{
        g1=new GasAuction();      
        vm.fee(50);  
        g1.bid(); // Assuming the highestbaseFee is set to 50 after this
    }
    // before running each of the cases the highest gas fee is set to 50


    function testNewBidderOnGivingHigherBid() public{

            vm.fee(100);  // giving >50 gas
            g1.bid();
            assertEq(g1.leader(),address(this),"ok");
            assertEq(g1.highestBasefee(),100,"ok"); // Ensure that 

    }


    function testNewBidderonGivingLesserBidthanCurrentOne() public{

            vm.fee(40);  // giving less than 50 gas won't make you leader
            vm.expectRevert();
            g1.bid();
    }


}