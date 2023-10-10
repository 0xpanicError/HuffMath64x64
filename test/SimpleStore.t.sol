// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";

interface IMath {
    function addNumbers(
        uint256,
        uint256,
        uint256,
        uint256
    ) external view returns (uint256, uint256);

    function fromInt(int256) external pure returns (int128);
}

contract MathTest is Test {
    IMath public math;
    uint256 public constant MAX = type(uint256).max;
    uint256 public constant MIN = type(uint256).min;

    function setUp() public {
        address addr = HuffDeployer.deploy("Wrapper");
        // Hardcoding the deployed address as there are some issues with --ffi and huffc
        math = IMath(addr);
    }

    function testAddNumbers() public {
        console2.log(MAX);
        (uint256 re, uint256 im) = math.addNumbers(420, 69, 76, 12);
        console2.log(re);
        console2.log(im);
        assertEq(re, 489);
        assertEq(im, 88);
    }

    // function testFromInt() public {
    //     console2.log(MAX);
    //     int128 result = math.fromInt(int256(5));
    //     console2.log(MAX);
    //     int256 a = 5;
    //     a = int128(a << 64);
    //     assertEq(result, a);
    // }

    // function testAddNumbers_fuzz(uint256 a, uint256 b) public {
    //     unchecked {
    //         uint256 c = a + b;

    //         if (c > MAX) {
    //             vm.expectRevert();
    //             math.addNumbers(a, b);
    //             return;
    //         }

    //         uint256 result = math.addNumbers(a, b);
    //         assertEq(result, a + b);
    //     }
    // }

    // function testSubNumbers() public {
    //     uint256 result = math.subNumbers(420, 69);
    //     assertEq(result, 351);
    // }

    // function testSubNumbers_fuzz(uint256 a, uint256 b) public {
    //     unchecked {
    //         uint256 c = a - b;
    //         if (c < MIN) {
    //             vm.expectRevert();
    //             math.subNumbers(a, b);
    //             return;
    //         }

    //         uint256 result = math.subNumbers(a, b);
    //         assertEq(result, a - b);
    //     }
    // }

    // function testMultiplyNumbers() public {
    //     uint256 result = math.multiplyNumbers(100, 69);
    //     assertEq(result, 6900);
    // }

    // function testMultiplyNumbers_fuzz(uint256 a, uint256 b) public {
    //     unchecked {
    //         uint256 c = a * b;

    //         if (c > MAX) {
    //             vm.expectRevert();
    //             math.multiplyNumbers(a, b);
    //             return;
    //         }

    //         uint256 result = math.multiplyNumbers(a, b);
    //         assertEq(result, a * b);
    //     }
    // }

    // function testDivideNumbers() public {
    //     uint256 result = math.divideNumbers(200, 10);
    //     assertEq(result, 20);
    // }

    // function testDivideNumbers_fuzz(uint256 a, uint256 b) public {
    //     vm.assume(b > 0);
    //     assertEq(math.divideNumbers(a, b), a / b);
    // }

    // function testAbs() public view {
    //     require(math.abs(1, 10) == 9);
    // }

    // function testAbs_fuzz(uint256 a, uint256 b) public view {
    //     uint256 _result = a > b ? a - b : b - a;
    //     require(math.abs(a, b) == _result);
    // }
}
