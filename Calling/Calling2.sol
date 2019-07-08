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

        address contract1 = address(c1);

        bytes4 sig = c1.voteCandidate.selector;
        //bytes4 sig = bytes4(keccak256("voteCandidate(address)"));

        bytes memory data = abi.encodeWithSelector(sig, msg.sender);
        (bool success, ) = contract1.call(data);
        require(success);
    }

    function checkVotes(address _address) public view returns (uint) {

        address contract1 = address(c1);

        bytes4 sig = c1.checkVotesCandidate.selector;
        //bytes4 sig = bytes4(keccak256("checkVotesCandidate(address)"));

        bytes memory data = abi.encodeWithSelector(sig, _address);
        (bool success, bytes memory returnValue) = contract1.staticcall(data);
        require(success);

        return abi.decode(returnValue, (uint256));
    }
}