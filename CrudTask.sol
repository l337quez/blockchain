
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract  TaskContract {
    uint nextId;
    struct Task {
        uint id;
        string name;
        string description;
    }

    Task[] tasks;

// ** POST
    function createTask(string memory _name, string memory _description) public{
        tasks.push(Task(nextId, _name, _description));
        nextId++;
    }

// Function is internal, is not public and no edit, is only view or read
// return integer positive
    function findIndex(uint _id) internal view returns(uint){
        for(uint i = 0; i< tasks.length; i++){
            if(tasks[i].id == _id){
                return i;
            }
        } 
        revert("Task not found");
    }

// ** GET
//string memory means that it will only be saved while the function is used, then it will be destroyed 
    function readTask(uint _id) public view returns(uint, string memory, string memory){
        uint index= findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }



// ** PUT
    function updateTask(uint _id, string memory _name, string memory _description) public{
        uint index= findIndex(_id);
        tasks[index].name = _name;
        tasks[index].description = _description;
    }  
}
