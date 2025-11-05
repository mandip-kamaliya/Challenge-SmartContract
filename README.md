Smart Contract Fundamentals Challenge

This repository contains a solution for the Smart Contract Fundamentals Challenge. It includes the modified SimpleStorage contract, a Foundry test file, and this explanation.

Modified Contract (contracts/SimpleStorage.sol)

The base SimpleStorage contract was extended with one new feature as requested:

NumberStored Event: A public event NumberStored(uint256 newNumber) was added.

Event Emission: The store(uint256 _favoriteNumber) function was modified to emit this new event every time it is called, passing the _favoriteNumber as the event's data.

Purpose of the Event

Events are a crucial part of smart contracts. They function as a logging mechanism that allows off-chain applications (like a website frontend) to efficiently "listen" for specific actions that occur on the blockchain.

Instead of an application having to repeatedly call the retrieve() function to check if the number has changed, it can simply subscribe to the NumberStored event. When the store function is executed, the event fires, and the application receives a notification automatically, along with the new number. This is the standard, efficient way to monitor contract activity.

Tests (test/SimpleStorage.t.sol)

A Foundry test file was created to verify the contract's functionality. Foundry tests are written directly in Solidity.

How the Tests Work

The file contains two primary tests (and one optional one) inside a SimpleStorageTest contract:

testStoreAndRetrieve:

This test verifies the contract's core storage logic.

The setUp() function first deploys a fresh instance of SimpleStorage.

The test calls the store() function with a test value (e.g., 77).

It then calls the retrieve() function.

Finally, it asserts (using assertEq) that the value returned by retrieve() is equal to the value that was stored.

testEmitNumberStoredEvent:

This test verifies the new event feature.

It uses Foundry's vm.expectEmit() cheatcode to tell the test runner to expect an event.

It specifies the exact event signature and data it expects: SimpleStorage.NumberStored(42).

It then calls the store() function with the test value (42).

The test automatically fails if the store() function does not emit this exact event.

These tests confirm that the contract not only stores data correctly but also properly notifies the outside world about that change via its event.