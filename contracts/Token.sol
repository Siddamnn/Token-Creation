// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private _owner;

    constructor() ERC20("Sid Token", "ST") {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == _owner,
            "Only the contract owner can call this function"
        );
        _;
    }

    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transfer(
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
}
