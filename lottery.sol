// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address[] public players;

    constructor() {
        manager = msg.sender; // contract deployer is the manager
    }

    // Players enter the lottery by sending Ether
    function enter() public payable {
        require(msg.value > 0.01 ether, "Minimum 0.01 ETH to enter");
        players.push(msg.sender);
    }

    // Generate pseudo-random number
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players)));
    }

    // Pick a winner (only manager can call this)
    function pickWinner() public restricted {
        require(players.length > 0, "No players entered");
        uint index = random() % players.length;
        address winner = players[index];

        // Modern transfer method
        (bool success, ) = payable(winner).call{value: address(this).balance}("");
        require(success, "Transfer failed.");

        players = new address[](0); // reset lottery
    }

    // Restrict certain functions to manager only
    modifier restricted() {
        require(msg.sender == manager, "Only manager can call this");
        _;
    }

    // Get list of players
    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}