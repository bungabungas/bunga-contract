//SPDX-License-Identifier: Unlicense

/**
 *  Public message storage board 

    - This contract will storage all the message data in public . 
    - Add White List
    - Setting the mint price

 */
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

struct message {
    uint256 fid;
    uint256[] cid;
    address owner ;
    bool    onChain;
    string  data;    
}


contract BungaPublicMessageBoard is ERC721URIStorage{
    using SafeMath for uint256;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    message[] private msgs;
    constructor() ERC721("BungaPublicMessageBoard", "BPMB") {

    }

/** 
 * Overwrite the transfer functions 
 */
    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override{
        require(false,"Not able to transfer ");
    }

/**
 * Action function
 */
    function newMsg(message memory m) public returns(uint256) {
        require(verfiFid(m.fid));
        msgs[m.fid].cid.push(msgs.length);
        m.owner = msg.sender;
        msgs.push(m);
        _setTokenURI(_tokenIds.current(), m.data);
        _tokenIds.increment();
        return msgs.length-1;
    }

/**
 * Verfication function
 */
    function verfiFid(uint256 f) public view returns(bool)
    {
        return (msgs.length-1 > f);
    }
/**
 * View only function 
 */
    function readMsg(uint256 from,uint256 to) public view returns(message[] memory)
    {
        message[] memory m = new message[](from-to);
        for(uint i = 0 ; from+i < to ; i ++)
        {
            m[i]=msgs[from+i];
        }
        return m;
    }

}