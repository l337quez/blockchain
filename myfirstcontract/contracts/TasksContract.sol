// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract  TasksContract {
    uint public taskCounter = 0;

    constructor(){
        createTask("mi primer tarea", "tengo que hacer algo");
    }

    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint256 createAt;
    }

// ** GET
// esto es como un buscador por id
mapping (uint256 => Task) public tasks;

// ** POST
    function createTask(string memory _title, string memory _description) public{
        tasks[taskCounter] = Task(taskCounter, _title,_description, false, block.timestamp);
        taskCounter++;
    }

// ** PUT
    function toggleDone(uint _id) public{
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
    }

}