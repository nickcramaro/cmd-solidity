pragma solidity ^0.4.19;

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract KGCoin is ERC20Interface {

    string public name;
    string public symbol;
    address public creator;
    uint public _totalSupply;
    mapping (address => uint) public balances;
    uint public PRICE = 1000000000000000000; //1 ether

    // event that notifies when a transfer has completed
    event Transfer(address from, address to, uint amount);

    function KGCoin() public {
        name = "KG Coin";
        symbol = "KGC";
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