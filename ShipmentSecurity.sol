// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShipmentSecurity {
    struct ShipmentLog {
        string shipmentId;
        string status;
        uint256 timestamp;
        string checkpoint;
    }

ShipmentLog[] public logs;

event LogAdded(string shipmentId, string status, uint256 timestamp, string checkpoint);

    function addLog(string memory _shipmentId, string memory _status, string memory _checkpoint) public {
        logs.push(ShipmentLog(_shipmentId, _status, block.timestamp, _checkpoint));
        emit LogAdded(_shipmentId, _status, block.timestamp, _checkpoint);
    }

function getLog(uint _index) public view returns(string memory, string memory, uint256, string memory) {
        ShipmentLog memory log = logs[_index];
        return (log.shipmentId, log.status, log.timestamp, log.checkpoint);
    }

function getLogsCount() public view returns (uint) {
        return logs.length;
    }
}