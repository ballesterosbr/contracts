pragma solidity ^0.5.0;

contract Strings {

    struct User {
        string _studies;
        uint _id;
    }

    mapping (address => User) students;

    function registerUser(string memory education, uint id) public {
        require(bytes(students[msg.sender]._studies).length == 0);
        require(bytes(education).length != 0 && id != 0);
        students[msg.sender] = User(education, id);
    }

    function getUser() public view returns(string memory, uint) {
        return (students[msg.sender]._studies, students[msg.sender]._id);
    }

    function updateUser(string memory education) public {
        require(bytes(education).length != 0);
        require(keccak256(abi.encodePacked(education)) != keccak256(abi.encodePacked(students[msg.sender]._studies)));
        students[msg.sender]._studies = education;
    }
}