// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Import Foundry's testing utilities
import {Test, console} from "forge-std/Test.sol";
// Import the contract we're testing
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    // Declare the SimpleStorage contract as a state variable
    SimpleStorage public simpleStorage;

    // The setUp function is called before each test case
    function setUp() public {
        // Deploy a new instance of SimpleStorage
        simpleStorage = new SimpleStorage();
    }

    // Test case 1: Verifies the store and retrieve functions
    function testStoreAndRetrieve() public {
        uint256 testValue = 77;

        // Call the store function
        simpleStorage.store(testValue);

        // Call the retrieve function
        uint256 retrievedValue = simpleStorage.retrieve();

        // Assert that the retrieved value equals the test value
        assertEq(retrievedValue, testValue);
    }

    // Test case 2: Verifies the NumberStored event
    function testEmitNumberStoredEvent() public {
        uint256 testValue = 42;

        vm.expectEmit(false, false, false, true);

        // Emit the event signature we expect
        emit SimpleStorage.NumberStored(testValue);

        // Call the function that should emit the event
        simpleStorage.store(testValue);

        // If the expected event was not emitted, the test will fail.
    }

    // Optional: A test for the addPerson function
    function testAddPerson() public {
        string memory testName = "Alice";
        uint256 testNumber = 10;

        // Call the addPerson function
        simpleStorage.addPerson(testName, testNumber);

        // Retrieve the number from the public mapping
        uint256 number = simpleStorage.nameToFavoriteNumber(testName);

        // Assert the values are equal
        assertEq(number, testNumber);
    }
}
