pragma solidity ^0.4.18;

contract Shop {

  mapping (address=>uint16) myApple;

  function buyApple() payable  external {
          myApple[msg.sender]++;
  }

  function getMyApples() view external returns(uint16)  {
          return myApple[msg.sender];
  }

  function sellMyApple(uint _applePrice) payable external {
        uint refund = (myApple[msg.sender] * _applePrice);
        myApple[msg.sender] = 0;
        msg.sender.transfer(refund);
  }
  
}