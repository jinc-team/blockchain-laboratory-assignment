// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(address => bool) public isMember;
    mapping(uint => mapping(address => uint8)) public votes;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address indexed voter);

    modifier onlyMember() {
        require(isMember[msg.sender], "Not a member");
        _;
    }

    constructor(address[] memory members) {
        isMember[msg.sender] = true;
        for (uint i = 0; i < members.length; i++) {
            isMember[members[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external onlyMember {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false
        }));

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool support) external onlyMember {
        Proposal storage proposal = proposals[proposalId];
        require(!proposal.executed, "Proposal already executed");

        uint8 currentVote = votes[proposalId][msg.sender];
        uint8 newVote = support ? 2 : 1;

        if (currentVote == 2) {
            proposal.yesCount--;
        } else if (currentVote == 1) {
            proposal.noCount--;
        }

        votes[proposalId][msg.sender] = newVote;
        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        emit VoteCast(proposalId, msg.sender);

        if (proposal.yesCount >= 10) {
            proposal.executed = true;
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Execution failed");
        }
    }
}
