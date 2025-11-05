// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint256 private favoriteNumber;
    mapping(string => uint256) public nameToFavoriteNumber;

    // 1. Add a public event
    event NumberStored(uint256 newNumber);

    function store(uint256 _favoriteNumber) public {
        // Fix the variable name from the original challenge description
        favoriteNumber = _favoriteNumber; 
        // Emit the event with the new number
        emit NumberStored(_favoriteNumber);
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}