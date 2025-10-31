// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title LedgerFall - A minimal decentralized ledger for recording simple transactions
/// @notice Allows users to store, view, and delete a single ledger record

contract LedgerFall {
    struct Record {
        string note;
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Record) private records;

    /// @notice store a ledger entry (note + amount)
    /// @param note description or purpose of the transaction
    /// @param amount amount or value associated with this record
    function addRecord(string calldata note, uint256 amount) external {
        records[msg.sender] = Record(note, amount, block.timestamp);
    }

    /// @notice view your own or another address’s record
    /// @param owner address of the record owner
    /// @return note description text
    /// @return amount stored value
    /// @return timestamp time of record creation
    function getRecord(address owner)
        external
        view
        returns (string memory note, uint256 amount, uint256 timestamp)
    {
        Record memory r = records[owner];
        return (r.note, r.amount, r.timestamp);
    }

    /// @notice delete your existing record
    function deleteRecord() external {
        delete records[msg.sender];
    }
}
