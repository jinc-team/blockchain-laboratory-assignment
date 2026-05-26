// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;
    
    // 1. Storage to track valid voting members
    mapping(address => bool) public isMember;

    // Track the vote states to prevent the double-counting bug
    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    // 2. Modifier to protect proposals and voting from non-members
    modifier onlyMember() {
        require(isMember[msg.sender], "Not a allowed member");
        _;
    }

    // 1. Constructor registering the array of members + the deployer
    constructor(address[] memory _members) {
        isMember[msg.sender] = true; // Allow the deployer
        for (uint i = 0; i < _members.length; i++) {
            isMember[_members[i]] = true; // Allow the passed-in addresses
        }
    }

    // Protected by onlyMember
    function newProposal(address _target, bytes calldata _data) external onlyMember {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }

    // Protected by onlyMember
    function castVote(uint proposalId, bool support) external onlyMember {
        Proposal storage proposal = proposals[proposalId];

        if (hasVoted[proposalId][msg.sender]) {
            bool previousChoice = voteChoice[proposalId][msg.sender];
            
            if (previousChoice == support) {
                return; // Prevents count corruption if same vote is submitted again
            }

            if (previousChoice && !support) {
                proposal.yesCount--;
                proposal.noCount++;
            } else if (!previousChoice && support) {
                proposal.noCount--;
                proposal.yesCount++;
            }
        } else {
            hasVoted[proposalId][msg.sender] = true;
            if (support) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }

        voteChoice[proposalId][msg.sender] = support;
    }
}