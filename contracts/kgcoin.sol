pragma solidity ^0.4.19;

contract KGCoin {

    address public creator;
    mapping (address => uint) public balances;
    uint public PRICE = 1000000000000000000; //1 ether

    // event that notifies when a transfer has completed
    event Transfer(address from, address to, uint amount);

    function KGCoin() public {
        creator = msg.sender;
    }

    function create() public payable {
        require(msg.value > 0 && msg.value % PRICE == 0);
        balances[msg.sender] += (msg.value / PRICE);
    }

    function balanceOf(address tokenOwner) public constant returns (uint balance) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint amount) public returns (bool success) {
        if (balances[msg.sender] < amount) {return;}
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Transfer(msg.sender, receiver, amount);
        return true;
    }
}