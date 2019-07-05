pragma solidity ^0.5.0;

contract AuctionGood {
    
    address highestBidder;
    uint highestBid;
    mapping(address => uint) public refunds;

    function bid() payable external {
        require(msg.value >= highestBid);

        if (highestBidder != address(0)) {
            refunds[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
    }    
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function getLeader() public view returns (address) {
        return highestBidder;
    }
    
    function withdrawRefund() external {
        uint refund = refunds[msg.sender];
        refunds[msg.sender] = 0;
        msg.sender.transfer(refund);
    }
}
