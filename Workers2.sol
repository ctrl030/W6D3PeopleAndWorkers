import "./People2.sol";

pragma solidity 0.5.12;

contract Workers2 is People2{
    
    mapping (address => uint) public salary;
    mapping (address => address) public boss; 

    //this function calls the createPerson function in People.sol and forwards any ether to that contract as well
    function createWorker(string memory nameP1, uint ageP1, uint heightP1, uint salaryP1, address bossP1) public payable costs(100 wei) {
        require (ageP1 < 75);
        require (bossP1 != msg.sender);
        createPerson(nameP1, ageP1, heightP1); 
        salary[msg.sender] = salaryP1;
        boss[msg.sender] = bossP1;
    }
        
    function fire (address addressToFire) public {
        require (boss[addressToFire] == msg.sender);
        
        deleteAddress(addressToFire);
        
        uint salaryP3 = salary[addressToFire];
        address bossP3 = boss[addressToFire];
        
        delete salary[addressToFire];
        delete boss[addressToFire];
        
        assert(peopleMapping[addressToFire].age == 0);
        
        emit workerFired (salaryP3, bossP3, owner);
    }    
}