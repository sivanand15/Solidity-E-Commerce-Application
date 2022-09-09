pragma solidity >=0.7.0 <0.8.0;

contract MyContract {
   
    
    mapping(uint => Producer) public people;
    mapping(uint => prodstat) public st;
    
    struct prodstat {
        uint cidstat;
        uint pidstat;
        string status;
    }
    
     uint i=15;
    function changeprice(uint id,string memory price) public{
       
       while(i>0)
        {
         Product storage pro = prod[i];
        if(pro._pid == id)
        {
            pro._price = price;
        }
        i -=1;
        }
        
    }
    
    function foo(uint cid,uint pid, string memory stat) external{
       st[cid] = prodstat(cid,pid,stat);
       
    }
    
    function fooview(uint cid) external view returns(uint,uint,string memory)
    {
        prodstat storage st1 = st[cid];
        return(st1.cidstat,st1.pidstat,st1.status);
        
    }
    
    mapping(uint => Product) public prod;
    struct Product {
        uint _pid;
        string _pName;
        string _price;
        string _quantity;
    }
    
    address owner;
    
    modifier onlyowner(){
        require (msg.sender == owner);
        _;
    }
    uint256 public pcount;
    uint256 public peoplecount;
    
    
    struct Producer {
        uint _id;
        string _firstname;
        string _lastname;
    }
    struct Orders{
        uint oid;
    }
    
   
   
    mapping(uint => Orders) public order;
    
    
    constructor() public{
        owner = msg.sender;
    }
    
    function addperson(string memory _firstname, string memory _lastname) public onlyowner {
        peoplecount +=1;
        people[peoplecount] = Producer(peoplecount, _firstname, _lastname);
        
    }
    
    function addproduct(uint _pid,string calldata _pName, string calldata _price, string calldata _quantity) external {
        pcount +=1;
        prod[pcount] = Product(_pid, _pName, _price, _quantity);
        
    }
    
    function orderProduct(uint id) external {
        order[id] = Orders(id);
        
    }
    
    
    
    function orderview(uint _id1) external view returns(uint , uint){
        Orders storage ords = order[_id1];
        Product storage prods = prod[_id1];
        return ( ords.oid, prods._pid );
    }
    
    
   
    
   
  
   
    function availProducts(uint i) external view returns(uint, string memory , string memory , string memory ){
        
      
        Product storage prods = prod[i];
        return ( prods._pid, prods._pName, prods._price, prods._quantity);
       
   }
   
   
  

}

    