// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract  TasksContract {
    uint public taskCounter = 0;


    // event hacen referencia a que algo ya paso. Con esto podremos guardar en los logs 
    event TaskCreated (
        uint id,
        string title,
        string description,
        bool done,
        uint256 createAt
    );


    event TaskToggleDone(uint id, bool done);

    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint256 createAt;
    }

    constructor(){
        createTask("mi primer tarea", "tengo que hacer algo");
    }

// ** GET
// esto es como un buscador por id
mapping (uint256 => Task) public tasks;

// ** POST
    function createTask(string memory _title, string memory _description) public{
        taskCounter++;
        tasks[taskCounter] = Task(taskCounter, _title,_description, false, block.timestamp);
        // guardamos en el array logs
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp);
    }

// ** PUT
    function toggleDone(uint256 _id) public{
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task;
        emit TaskToggleDone(_id, _task.done);
    }

}