pragma solidity ^0.5.0;

contract Contract1 {

    uint256 maxVotes = 20;
    address owner;
    mapping (address => uint256) votes;

    constructor () public {
        owner = msg.sender;
    }

    modifier notOwner {
        require(msg.sender != owner);
        _;
    }

    function voteCandidate(address _address) public notOwner {
        require(votes[_address] < maxVotes);
        require(_address != msg.sender);
        votes[_address]++;
    }

    function checkVotesCandidate(address _address) public view returns (uint) {
        return votes[_address];
    }
}

contract Caller1 {

    Contract1 c1;

    constructor(address _address) public {
        c1 = Contract1(_address);
    }

    function voteCandidate() public {
        c1.voteCandidate(msg.sender);
    }

    function checkVotes(address _address) public view returns (uint) {
        return c1.checkVotesCandidate(_address);
    }
}