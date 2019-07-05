pragma solidity ^0.5.0;

contract Vulnerable1 {
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    function () external payable{
        revert();
    }
}

contract Vulnerable2 {
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    function() external {}
}

contract EtherSender {
    
    Vulnerable1 public vulnerable1 = new Vulnerable1();
    Vulnerable2 public vulnerable2 = new Vulnerable2();
    
    constructor () public payable {}
    
    function callVulnerable1() public { 
        selfdestruct(address(vulnerable1));
    }
    
    function callVulnerable2() public {
        //selfdestruct(address(vulnerable2));
        address vuln2 = address(vulnerable2);
        assembly {
            selfdestruct(vuln2)
        }
    }
}
