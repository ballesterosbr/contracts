pragma solidity ^0.5.0;

/**
Create a Factory contract called IDcard
*/
{
    /**
    Set owner
    */
    
    /**
    Create a struct named User.
    Add a IDcard_issuer, owner of the ID (not this ccontract), UserID_address, timestamp
    Figure out what the appropriate types are,
    */

    /**
    Create a public mapping that maps the address to a User.
    Call this mapping users
    */

    /* Create one event for the new contract creation.
    Save the user calling the function, timestamp and UserID address.
    */

    /**
    Create a modifier that checks if the msg.sender is the owner of the contract
    */
    
    constructor() public{
        /**
        Here, set the owner as the person who instantiated the contract.
        */
    }

    /**
    Generate a new IDCard. Create a new UserID contract.
    Set as an atribute the user address that is calling this function.
    Save the info in User.
    Emit the event.
    Only if the user doesn't has a UserID created.
    */
    function newUserID()
        public       
    {

    }

   /** 
   Get User info.
   Add the keywords for getters functions
    */
    function getUser()
        public
    {
        
    }
}

/**
Create a new contract called UserID
*/
{

    /**
    Set owner
    */

    /**
    Set a boolean variable called isData
    */

    /**
    Create a struct named User.
    Add a name, lastname, age, id_number, birthdate, gender, city, country
    Figure out what the appropriate types are,
    */
    
    /**
    Create a public mapping that maps the address to a User.
    Call this mapping myId
    */

    /**
    Create a modifier that checks if the msg.sender is the owner of the contract
    */

    /* Create three events.
    Create, Update, Delete info.
    Save the user calling the function, timestamp and UserID address.
    */
    
    /**
    Set as attribute the address of the new owner
    */
    constructor(...) public{
         /**
        Here, set the owner as the person who instantiated the contract.
        FROM THE FACTORY CONTRACT.
        */
    }

    /**
    Add user information.
    Only the owner can call this function.
    Use isData to check if data already exists. If is empty, data can be created.
    Emit the event.
    */
    function newInfo ()
        public
    {   
        
    }
    
    /**
    Update user information.
    Only the owner can call this function.
    Use isData to check if data already exists. If is not empty, data can be updated.
    Emit the event.
    */
    function updateInfo ()
        public
    {   
        
    }
    
    /** 
    Get User info.
    Add the keywords for getters functions
    */
    function getInfo ()
        public
    {
        
    }
    
    /**
    Remove user information.
    Only the owner can call this function.
    Use isData to check if data already exists. If is empty, data can't be removed.
    Emit the event.
     */
    function removeInfo ()
        public
    {
       
    }
}
