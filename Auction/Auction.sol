pragma solidity ^0.5.0;

// VULNERABLE
contract Auction {
    
    address payable currentLeader;
    uint highestBid;

    function bid() public payable {
        require(msg.value > highestBid);

        currentLeader.transfer(highestBid);

        currentLeader = msg.sender;
        highestBid = msg.value;
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function getLeader() public view returns (address) {
        return currentLeader;
    }
}
