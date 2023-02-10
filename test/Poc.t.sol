// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;


import "../src/Implementation.sol";
import "forge-std/Test.sol";
import "../src/Proxy.sol";

contract SimplePocTest is Test {
    Implementation internal implementation;
    Proxy internal proxy;

    function setUp() public {
        implementation = new Implementation();
    }

    function testIncrement() public {}

    function testSetNumber(uint256 x) public {}
}
