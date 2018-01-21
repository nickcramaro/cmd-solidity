pragma solidity ^0.4.19;

contract Hodor {
    string greeting;

    function Hodor(string _greeting) public {
        greeting = _greeting;
    }

    function greet() public constant returns (string) {
        return greeting;
    }
    
    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }
}