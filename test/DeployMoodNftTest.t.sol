//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft deployer;
    address public USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bW5scz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIiA+PHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9ImJsYWNrIj4gSGkgWW91IGRlY29kZWQgdGhpcyA8L3RleHQ+PC9zdmc+Cg==";
        string
            memory svg = '<svg xmnls="http://www.w3.org/2000/svg" width="500" height="500" ><text x="0" y="15" fill="black"> Hi You decoded this </text></svg>';

        string memory actualUri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
