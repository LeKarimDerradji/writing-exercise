// SPDX-License-Identifier: MIT
// NOTE: These contracts have a critical bug.
// DO NOT USE THIS IN PRODUCTION.
pragma solidity 0.8.10;

/// The implementation contract for the Proxy (see: `Proxy.sol`).
///
/// Only deployed once and the implementation is reused by all proxy contracts.
contract Implementation {
    //@audit external call to any contract
    function callContract(
        address a,
        bytes calldata _calldata
    ) external payable returns (bytes memory) {
        (bool success, bytes memory ret) = a.call{value: msg.value}(_calldata);
        require(success);
        return ret;
    }

    //@audit delegateCall to an address controled by any with calldata
    function delegatecallContract(
        address a,
        bytes calldata _calldata
    ) external payable returns (bytes memory) {
        (bool success, bytes memory ret) = a.delegatecall(_calldata);
        require(success);
        return ret;
    }
}
