pragma solidity ^0.5.0;

contract Underflow {
    
    mapping (address => uint8) public votes;
    
    function vote(address _address) public {
        votes[_address] -= 1;
    }
}
