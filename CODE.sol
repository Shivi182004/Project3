// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ExceptionHandlingExample {
    address public owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function assertExample(uint x, uint y) public pure returns (uint) {
        // assert is used to check for conditions that should never be false
        assert(x != y); // Ensure x is not equal to y
        
        return x + y;
    }

    function revertExample(uint x) public pure returns (uint) {
        // revert is used to revert the transaction with an error message
        require(x != 0, "Input must be non-zero");
        
        return 100 / x;
    }

    function onlyOwner() public view {
        require(msg.sender == owner, "Only contract owner can call this function");
        // Function content here
    }
}
