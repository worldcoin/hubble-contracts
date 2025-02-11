// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { DefaultAccountTree } from "../DefaultAccountTree.sol";

contract TestAccountTree is DefaultAccountTree {
    function updateSingle(bytes32 leaf) external returns (uint256) {
        uint256 operationGasCost = gasleft();
        _updateSingle(leaf);
        return operationGasCost - gasleft();
    }

    function updateBatch(bytes32[BATCH_SIZE] calldata leafs)
        external
        returns (uint256)
    {
        uint256 operationGasCost = gasleft();
        _updateBatch(leafs);
        return operationGasCost - gasleft();
    }

    function checkInclusion(
        bytes32 leaf,
        uint256 leafIndex,
        bytes32[WITNESS_LENGTH] calldata witness
    ) external view returns (uint256, bool) {
        uint256 operationGasCost = gasleft();
        bool s = _checkInclusion(leaf, leafIndex, witness);
        return (operationGasCost - gasleft(), s);
    }
}
