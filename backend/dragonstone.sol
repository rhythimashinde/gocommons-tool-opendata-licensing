pragma solidity ^0.4.21;

contract Dragonstone{
    mapping (address =>uint) public balances;
    address public owner;
    uint public PRICE = 30000000000000000000; // 3 ether in wei
    
    function Dragonstone() {
        owner = msg.sender;
    }
    
    function create() payable {
        require(msg.value > 0 && msg.value % PRICE ==0);
        balances[msg.sender] += msg.value/PRICE;
    }
    
    function transfer(){
        (address receiver, uint amount){
        require(balances[msg.sender] >= amount);
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
    }
}