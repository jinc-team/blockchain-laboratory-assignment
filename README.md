## Group Assignment

This repository is organized as the shared assignment workspace for the Solidity course. Each major course area has its own folder, and each practice section is split into smaller question folders so the completed work is easy to review and verify.

The root layout uses zero-padded numeric prefixes and lowercase kebab-case so the course order stays readable in the file tree.

## Group Members

Add the group members here with their IDs:

- Abdeta Terefe - UGE/27670/14
- Hundaol Worku - UGE/27700/14
- Samuel Alemayehu - UGE/27725/14

## Member Folders

Each group member should keep their work inside their own root folder at the top level of the repository. Inside that personal folder, the same course structure should be followed so individual contributions stay clear and easy to review.

The screenshot showing course completion should be placed at the root of each member folder so it is easy to find quickly.

Recommended pattern:

- `member-name/`
  - `01-solidity-introduction/`
  - `02-address-interactions/`
  - `03-reference-types/`
  - `04-applied-solidity/`

## Practice Pattern

Every practice section in this repository follows the same structure:

- One root folder for the course topic.
- One subfolder per practice question or stage.
- A `README.md` inside each question folder with the short goal or note.
- A `solution.sol` file inside each question folder with the final code.
- Optional proof files such as screenshots or test output when needed.

Use the same numbering pattern throughout the repository so the folders stay in course order and are easy to scan.

## Repository Layout

```text
01-solidity-introduction/
├── 01-smart-contracts/
│   ├── 01-course-overview/
│   ├── 02-smart-contracts-overview/
│   ├── 03-value-types/
│   └── 04-practice-data-types/
└── 02-functions-and-value-types/
    ├── 01-storage-variables/
    ├── 02-functions/
    └── 03-practice-solidity-functions/

02-address-interactions/
├── 01-sending-ether/
│   ├── 01-message-calls/
│   └── 02-practice-sending-ether/
├── 02-reverting-transactions/
│   ├── 01-reverting-transactions/
│   └── 02-practice-reverting-transactions/
├── 03-calling-contracts/
│   ├── 01-calling-contracts/
│   └── 02-practice-calldata/
└── 04-escrow/
    ├── 01-escrow-explanation/
    └── 02-build-an-escrow/

03-reference-types/
├── 01-arrays/
│   ├── 01-arrays/
│   └── 02-practice-arrays/
├── 02-structs/
│   ├── 01-structs/
│   └── 02-practice-structs/
└── 03-mappings/
    ├── 01-mappings/
    └── 02-practice-mappings/

04-applied-solidity/
├── 01-voting/
│   ├── 01-voting-explanation/
│   └── 02-build-a-voting-contract/
├── 02-inheritance/
│   ├── 01-inheritance/
│   └── 02-practice-inheritance/
└── 03-wrap-up/
    ├── 01-wrap-up-video/
    └── 02-course-completion/
```
