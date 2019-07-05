pragma solidity ^0.5.0;

contract Overflow {
    
    mapping (address => uint256) public balanceOf;
    
    constructor() public {
        balanceOf[msg.sender] = 2**256 - 1;
    }
    
    function transferInsecure(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
    
    function () external payable {
        balanceOf[msg.sender] += msg.value;
    }

    function transferSecure(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}
