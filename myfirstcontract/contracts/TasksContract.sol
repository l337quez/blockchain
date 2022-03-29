// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract  TasksContract {
    uint taskCounter = 0;
    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint256 createAt;
    }

mapping (uint256 => Task) public task;

// ** POST
    function createTask(string memory _title, string memory _description) public{
        task[taskCounter] = Task(taskCounter, _title,_description, false, block.timestamp);
        taskCounter++;
    }


}