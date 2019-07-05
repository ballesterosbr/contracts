pragma solidity ^0.5.0;

contract Ownable {
    
    address private _owner;

    constructor() public {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    function isOwner() public view returns(bool) {
        return msg.sender == _owner;
    }
}

/**
Create a contract called Purchase that inherits Ownable
*/
contract Purchase is Ownable {

    /**
    Create a enum called State with three states:
    Invalid, OnSale, Sold
    */

    /**
    Create a struct named Article.
    Add a id, seller, buyer, price and status (State!!!!).
    Figure out what the appropriate types are,
    */

    /**
    Create a public mapping that maps the id to an Article.
    Call this mapping articles
    */

    /**
    Create a modifier that checks if the id does not exists
    Need a parameter (article id)
    */

    /**
    Create a modifier that checks the msg.sender is not the seller
    Need a parameter (article id)
    */

    /**
    Create a modifier that checks the status is Sold
    Need a parameter (article id)
    */

    /**
    Create a modifier that checks the status is OnSale
    Need a parameter (article id)
    */

    /**
    Create a modifier that checks if msg.value is the price
    Need a parameter (article id)
    */

    /**
    Create a new article.
    User defines the id and the price.
    The seller is the msg.sender.
    Set status -> OnSale
    Only if the _id does not exist
    */
    function newArticle (...) 
        public
    {

    }
    
    /**
    Buy the article. This function should transfer money
    to the seller, set the buyer as the person who called this transaction.
    Set status -> Sold
    Only if the buyer is not the seller.
    Only if the article is OnSale
    CheckPrice before
    */
    function buyArticle (...) 
        public
    {

    }
    /**
    Delete the article
    Only if the article is Sold
    Only the owner can call this function.
    */
    function removeArticle (...)
        public
    {
        
    }
}
