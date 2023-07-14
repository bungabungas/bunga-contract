//SPDX-License-Identifier: Unlicense

/**
    Private Message Contract 

    - This contract will storage all your data onchain (totally onchain) .
    - All the data upload to chain should be encryped by your sign . So , only you can read then .

 */
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract BungaPrivateData is ERC721URIStorage{
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    mapping(address => uint256) private idIdex;
    Counters.Counter private _tokenIds;


    constructor() ERC721("BungaPrivateData", "BPD") {
        
    }

    function set(string memory s)
        public
    {
        uint256 id = idIdex[msg.sender];
        if(id==idIdex[address(0)])
        {
            id = _tokenIds.current();
            _tokenIds.increment();
        }
        _setTokenURI(id, s);
    }

    function get(address a) public view returns(string memory)
    {
        return tokenURI(idIdex[a]);
    }
}