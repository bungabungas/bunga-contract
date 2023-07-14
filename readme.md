# Bunga Contract

**This repo is to build a totally decentralized media system base on ERC721 and ERC6551**

## How this shit work ?

The core of building a media system by solidity and save gas is to build the `index` on-chain but data off-chain (may be in IPFS or Storj )

The Nft is a good way to build such `index` by storage everything by `tokenId` , so we build it follow the ERC721's formate and storage other link data and logic in other contract . 

Works as follow :

- Data Contract (ERC721 Base & ERC6551 Base)
    - Create(mint)
        - To storage all the important data in a link or cid directly to IPFS . 
        - Able to selled or transfered . 

- Private Board Contract 
    - Get 
        - Get the encrypted data from chain
    - Set
        - Set the encrypted data to chain

- Public Message Board Contract
    - New
    - Event

- Account System 
    - Catalogue (Key Words)
        - New
    - Media (Index to NFT)
        - New 
    - Indexes
        - Media to Catalogue
        - Media to original poster
        - Media to message
        - Media to comment

## Why should we build our media decentralized

I'm not going to wasting time in talking , Because everyone knows how media system like facebook / twitter / sina / tiktok / youtub control the social world .

If you don't want to be a asshole with all correct boring shit around , better don't wast your shit time on meaningless identify . 

    