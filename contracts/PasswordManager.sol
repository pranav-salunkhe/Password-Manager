// SPDX-License-Identifier: MIT
pragma solidity >=0.8.7 <0.9.0;

contract PasswordManager {
    address public heartAddress;
    mapping(string => string) lockToKey;
    string[] private locks;

    function setHeartAddress(address _heartAddress) public {
        require(heartAddress == address(0), "Value has already been set");
        heartAddress = _heartAddress;
    }

    function setLockAndKey(string memory _lock, string memory _key) public {
        require(msg.sender == heartAddress, "Unauthorized access");
        lockToKey[_lock] = _key;
        locks.push(_lock);
    }

    function retrieveKey(string memory _lock) public view returns(string memory){
        require(msg.sender == heartAddress, "Unauthorized access");
        return lockToKey[_lock];
    }

    function resetEverything() public {
        require(msg.sender == heartAddress, "Unauthorized access");
        heartAddress = address(0);
        resetMapping();
    }

    function resetMapping() public {
        // Iterate through all the keys in the mapping and reset their values to ""
        require(msg.sender == heartAddress, "Unauthorized access");
        for (uint256 i = 0; i < locks.length; i++) {
            lockToKey[locks[i]] = "";
        }
    }
}