
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define the ProjectToken contract
contract ProjectToken {
    string public name = "ProjectToken";
    string public symbol = "PTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Mapping from account addresses to their balances
    mapping(address => uint256) public balanceOf;
    // Mapping from account addresses to allowed spending limits
    mapping(address => mapping(address => uint256)) public allowance;

    // Event for token transfers
    event Transfer(address indexed from, address indexed to, uint256 value);
    // Event for approval of spending
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        // Mint an initial supply of tokens to the contract creator
        totalSupply = 1000000 * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    // Transfer tokens to a specified address
    function transfer(address to, uint256 value) public returns (bool success) {
        require(to != address(0), "Invalid address");
        require(balanceOf[msg.sender] >= value, "Insufficient balance");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    // Approve a spender to spend a specified amount of tokens on behalf of the caller
    function approve(address spender, uint256 value) public returns (bool success) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    // Transfer tokens from one address to another on behalf of the owner
    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(to != address(0), "Invalid address");
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Allowance exceeded");

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
}
