import "./People.sol";

pragma solidity 0.5.12;

contract Workers is People{
    
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
    
    // experimental    
    // function findAndDeleteWorkerFromArray (address addressFromEntryToDelete) {
    // }
    
    function fire (address addressToFire) public {
        require (boss[addressToFire] == msg.sender);
        // storing values to be deleted temporarily to emit after deletion            
        
        string memory nameP3 = peopleMapping[addressToFire].name;
        uint ageP3 = peopleMapping[addressToFire].age;
        uint heightP3 = peopleMapping[addressToFire].height;
        bool alreadyTwentyOneP3 = peopleMapping[addressToFire].alreadyTwentyOne;
        
        uint salaryP3 = salary[addressToFire];
        
        address bossP3 = boss[addressToFire];

        // experimental
        // address exWorkerAddressP3 = creators[addressToFire];
        // delete creators[addressToFire];        
        
        delete peopleMapping[addressToFire];
        delete salary[addressToFire];
        delete boss[addressToFire];
        
        assert( peopleMapping[addressToFire].age == 0 );
        
        emit workerFired (nameP3, ageP3, heightP3, alreadyTwentyOneP3, salaryP3, bossP3, owner);
        
        
    }
    
}




