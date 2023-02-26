// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IBAYC.sol";

contract BAYCStaking is ERC20 {

    address owner;
    IBAYC BAYCADD;


    struct User {
        address _address;
        uint _amount;
        uint rewardAccrued;
        uint _timestamp;
    }

    mapping(address => User) UserDetails;

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol){
        uint _amount = 1000000 * (1*10**(decimals()));
        owner = msg.sender;
        _mint(msg.sender, _amount);
        BAYCADD = IBAYC(0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function stake(uint _amount) public {
        require(BAYCADD.balanceOf(msg.sender) >= 1, "You are not a BAYC holder");
        User memory _user = UserDetails[msg.sender];
        _user._amount += _amount;
        _user._timestamp = block.timestamp;
        UserDetails[msg.sender] = _user;
    }

    receive() payable external{}

    fallback() payable external{}

}
