// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract GasAuction {
    address public leader;
    uint256 public highestBasefee;

    event NewLeader(address indexed bidder, uint256 basefee);

    function bid() external {
        uint256 currentBasefee = block.basefee;

        require(currentBasefee > highestBasefee, "Basefee too low to win");

        leader = msg.sender;
        highestBasefee = currentBasefee;

        emit NewLeader(msg.sender, currentBasefee);
    }
}
