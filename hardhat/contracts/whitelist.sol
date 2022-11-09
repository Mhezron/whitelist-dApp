//SPDX-License-Identifier : unlicensed

pragma solidity ^0.8.0;

contract Whitelist {
    
    //max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //create a mapping of whitelistes addresses allowed
    mapping (address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    //setting the max number of whitelisted addresses
    //user will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }


    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");
        
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "more addresses can't be added, limit reached");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;
    }

}
