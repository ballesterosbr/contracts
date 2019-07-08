pragma solidity ^0.5.0;

contract GasLimitDos {

    struct Payee {
        address payable addr;
        uint256 value;
    }

    Payee[] payees;
    uint256 public nextPayeeIndex;

    constructor() public payable {
        payees.push(Payee(msg.sender, msg.value/2));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
        payees.push(Payee(address(0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C), msg.value/100));
    }

    function payOut() public{
        uint256 i = nextPayeeIndex;
        while (i < payees.length && gasleft() > 200000) {
            payees[i].addr.transfer(payees[i].value/10);
            i++;
        }
        nextPayeeIndex = i;
    }

    function getPayee(uint256 _index) public view returns(address, uint256) {
        return (payees[_index].addr, payees[_index].value);
    }
}