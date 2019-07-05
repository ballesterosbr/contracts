pragma solidity ^0.5.0;

contract Reentrancy {
    
    mapping (address => uint) public balances;
    
    constructor() public payable {
        setEther();
    }
    
    function setEther() public payable {
        balances[msg.sender] = msg.value;
    }
  
    function withdrawEther() public{
        msg.sender.call.value(balances[msg.sender])("");
        balances[msg.sender] = 0;
    }
  
    function() external payable{
        revert();
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}
