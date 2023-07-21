// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }
    
    Todo[] public todos;
    
    function create (string calldata _text) external {
        todos.push(Todo({text: _text, completed: false }));
    }

    function updateText (uint _index, string calldata _text) external {
        // todos[_index].text = _text; // 원래 내가 생각한 솔루션
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted (uint _index) external {
        Todo storage todo = todos[_index];
        // bool _completed = todo.completed;
        // todos[_index].completed = !_completed; // 
        todo.completed = !todo.completed;
    }
    
    function get(uint _index) external view returns (string memory, bool){
        Todo storage myTodo = todos[_index];
        return (myTodo.text, myTodo.completed);
    }
}
