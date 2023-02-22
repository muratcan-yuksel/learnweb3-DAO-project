// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract FakeNFTMarketplace {
    //maintain a mapping of fake tokenid to owner addresses
    mapping(uint256 => address) public tokens;
    //set the purchase price for each fake nft
    uint256 nftPrice = 0.01 ether;

    //purchase() accepts eht and marks the owner of the given tokenid as the caller address
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "Not enough ETH");
        tokens[_tokenId] = msg.sender;
    }

    // getPrice returns the price of one nft
    function getPrice() external view returns (uint256) {
        return nftPrice;
    }

    //available() checks whether the given tokenid has already been sold or not
    //param _tokenId: the tokenid to check
    function available(uint256 _tokenId) external view returns (bool) {
        // address(0) = 0x0000000000000000000000000000000000000000
        // This is the default value for addresses in Solidity
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}
