pragma solidity >=0.4.21 <0.7.0;

contract Deadquiz {
    enum status {
    unknown,alive,missing
    }
  
    status public setStatus;
    uint public time;
    uint public deadTime;
    address public owner;

    constructor() public{
        owner = msg.sender;
        setStatus = status.unknown;
        deadTime = block.timestamp + 120 seconds;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Invalid Owner"); _;
    }

    function aliveCheck(string memory input) public isOwner(){
            if(keccak256(abi.encodePacked(input)) == keccak256(abi.encodePacked("alive")) && block.timestamp <= deadTime){
                setStatus = status.alive;
            }else if(block.timestamp > deadTime){
                setStatus = status.missing;
            }
        }

    function getStatus() public view returns(string memory){
        if(block.timestamp > deadTime){
            return "dead";
        }else if(status.unknown == setStatus){
            return "unknown";
        }else if(status.alive == setStatus){
            return "alive";
        }
    }
}
