// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices choice) external {
        require(!hasVoted(msg.sender), "Address has already voted");
        votes.push(Vote(choice, msg.sender));
    }

    function changeVote(Choices choice) external {
        bool found = false;
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = choice;
                found = true;
                break;
            }
        }
        require(found, "No existing vote found");
    }

    function hasVoted(address _voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }
}
