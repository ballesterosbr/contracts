pragma solidity ^0.5.0;

contract SimpleBank {

    /* Fill in the keyword. Hint: We want to protect our users balance from other contracts
    Mapping map users with balances*/

    /* Let's make sure everyone knows who owns the bank. Use the appropriate keyword for this*/
    
    // Events - publicize actions to external listeners
    /* Add 2 arguments for this event, an accountAddress and an amount */

    // Constructor, can receive one or many variables here; only one allowed
    constructor() public{
        /* Set the owner to the creator of this contract */
    }

    /// @notice Enroll a customer with the bank, giving them 1000 tokens for free
    /// @return The balance of the user after enrolling
    function enroll() public returns (uint){
      /* Set the sender's balance to 1000, return the sender's balance */
    }

    /// @notice Deposit ether into bank
    /// @return The balance of the user after the deposit is made
    // Add the appropriate keyword so that this function can receive ether
    function deposit() public payable returns (uint) {
        /* Add the amount to the user's balance, call the event associated with a deposit,
          then return the balance of the user */
    }

    /// @notice Withdraw ether from bank
    /// @dev This does not return any excess ether sent to it
    /// @param withdrawAmount amount you want to withdraw
    /// @return The balance remaining for the user
    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        /* If the sender's balance is at least the amount they want to withdraw,
           Subtract the amount from the sender's balance, and try to send that amount of ether
           to the user attempting to withdraw. IF the send fails, add the amount back to the user's balance
           return the user's balance.*/
    }

    /// @notice Get balance
    /// @return The balance of the user
    // A SPECIAL KEYWORD prevents function from editing state variables;
    // allows function to run locally/off blockchain
    function balance() public view returns (uint) {
        /* Get the balance of the sender of this transaction */
    }

    // Fallback function - Called if other functions don't match call or
    // sent ether without data
    // Typically, called when invalid data is sent
    // Added so ether sent to this contract is reverted if the contract fails
    // otherwise, the sender's money is transferred to contract
    function () external{
        revert();
    }
}
