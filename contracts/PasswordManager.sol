// SPDX-License-Identifier: MIT
pragma solidity >=0.8.7 <0.9.0;

contract PasswordManager {
    address public heartAddress;
    string lock;
    string key;
    mapping(string => string) lockToKey;

    function setHeartAddress(address _heartAddress) public {
        heartAddress = _heartAddress;
    }

    function setLockAndKey(string memory _lock, string memory _key) public {
        require(msg.sender == heartAddress, "Unauthorized access");
        lockToKey[_lock] = _key;
    }

    function retrieveKey(string memory _lock) public view returns(string memory){
        require(msg.sender == heartAddress, "Unauthorized access");
        return lockToKey[_lock];
    }
}