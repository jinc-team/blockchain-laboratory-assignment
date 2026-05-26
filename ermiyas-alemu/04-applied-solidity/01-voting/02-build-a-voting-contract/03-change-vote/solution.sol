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
    
    // Tracks if an address has voted on a proposal ID
    mapping(uint => mapping(address => bool)) public hasVoted;
    // Tracks the actual choice of the address on a proposal ID (true = yes, false = no)
    mapping(uint => mapping(address => bool)) public voteChoice;

    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }

    function castVote(uint proposalId, bool support) external {
        Proposal storage proposal = proposals[proposalId];

        // Case 1: The voter has already voted on this proposal before
        if (hasVoted[proposalId][msg.sender]) {
            bool previousChoice = voteChoice[proposalId][msg.sender];
            
            // If they are attempting to vote the exact same way, do nothing (or revert)
            if (previousChoice == support) {
                return; 
            }

            // If changing from YES to NO
            if (previousChoice && !support) {
                proposal.yesCount--;
                proposal.noCount++;
            } 
            // If changing from NO to YES
            else if (!previousChoice && support) {
                proposal.noCount--;
                proposal.yesCount++;
            }
        } 
        // Case 2: This is their first time voting on this proposal
        else {
            hasVoted[proposalId][msg.sender] = true;
            if (support) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
        }

        // Update their current choice state
        voteChoice[proposalId][msg.sender] = support;
    }
}