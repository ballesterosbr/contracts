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

        bytes4 sig = bytes4(keccak256("voteCandidate(address)"));
        address contract1 = address(c1);

        assembly {
            let ptr := mload(0x40)
            mstore(ptr,sig)
            mstore(add(ptr,0x04), caller)

            let result := call(not(0), contract1, 0, ptr, 0x24, ptr, 0)

            if iszero(result) {
                revert(0, 0)
            }
        }
    }

    function checkVotes(address _address) public view returns (uint) {

        bytes4 sig = bytes4(keccak256("checkVotesCandidate(address)"));
        address contract1 = address(c1);

        assembly {
            let ptr := mload(0x40)
            mstore(ptr,sig)
            mstore(add(ptr,0x04), _address)

            let result := staticcall(not(0), contract1, ptr, 0x24, ptr, 0x20)

            let size := returndatasize
            returndatacopy(ptr, 0, size)
            switch result case 0 { revert(0, 0) }

            return(ptr, size)
        }
    }
}