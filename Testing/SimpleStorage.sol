pragma solidity ^0.5.0;

contract SimpleStorage {
    uint storedData;
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    function setOwner(uint x) public onlyOwner {
        storedData = x;
    }
}