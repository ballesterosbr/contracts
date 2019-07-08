pragma solidity ^0.5.0;

contract PureView {

    string constant textConstant = "abc";
    string text = "bcd";

    function getConstant() public pure returns (string memory) {
        return textConstant;
    }

    function getConstant2() public view returns (string memory) {
        return text;
    }
}