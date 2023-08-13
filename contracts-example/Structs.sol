//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car[] public cars;

    function examples () external {
        // Initialization 
        Car memory hyendai = Car ("Hyendai", 1980, msg.sender);
        Car memory lambo = Car({
            model: "Lamborgini", 
            year: 1999, 
            owner: msg.sender
        });
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2020;
        tesla.owner = msg.sender;

        cars.push(hyendai);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2000, msg.sender));

        Car storage car = cars[0];
        car.year = 1988;
    }

    function register (string memory _model, uint _year) external {
        cars.push(Car({model: _model, year: _year, owner: msg.sender}));
    }

    function get (uint _index) external view returns(string memory model, uint year, address owner) {
        Car storage car = cars[_index];
        return(car.model, car.year, car.owner);
    }

    function transfer (uint _index, address _owner) external {
        cars[_index].owner = _owner;
    }
}