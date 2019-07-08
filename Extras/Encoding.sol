pragma solidity ^0.5.0;

contract Encoding {

    function produceHash(string memory _a, string memory _b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }

    function collision(string memory _a, string memory _b, string memory _c, string memory _d) public pure returns (bool) {
        return(keccak256(abi.encodePacked(_a, _b)) == keccak256(abi.encodePacked(_c, _d)));
    }

    function avoidCollision(string memory _a, string memory _b, string memory _c, string memory _d) public pure returns (bool) {
        return(keccak256(abi.encode(_a, _b)) == keccak256(abi.encode(_c, _d)));
    }

    function encodeOutput (string memory _a, string memory _b) public pure returns (bytes memory) {
        return abi.encode(_a,_b);
    }

    function encodePackedOutput (string memory _a, string memory _b) public pure returns (bytes memory) {
        return abi.encodePacked(_a,_b);
    }
}