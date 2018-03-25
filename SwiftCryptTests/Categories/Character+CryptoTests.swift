//
//  Character+CryptoTests.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/5/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

@testable import SwiftCrypt
import XCTest

class CharacterCryptoTests: XCTestCase {
    // MARK: CHARACTER CRYPTO TESTS

    /// Test an ASCII `Character` to `Int` conversion.
    func testAsciiValueToInt() {
        let c: Character = "A"
        let i = c.asciiValue

        XCTAssertEqual(i, 65, "ASCII value not generating correctly")
    }

    /// Test an non-ASCII `Character` to `Int` conversion.
    func testNonAsciiValueToInt() {
        let c: Character = "\u{1F60A}"

        XCTAssertNil(c.asciiValue, "ASCII value should not have generated")
    }

    /// Test if a letter `Character` is correctly reported as a letter.
    func testLetterIsALetter() {
        let c: Character = "A"

        XCTAssertTrue(c.isALetter, "Letter Character is not reporting if it is a letter correctly")
    }

    /// Test if a number `Character` is correctly reported as not a letter.
    func testNumberIsNotALetter() {
        let c: Character = "1"

        XCTAssertFalse(c.isALetter, "Number Character is not reporting if it is a letter correctly")
    }

    /// Test if an ASCII symbol `Character` is correctly reported as not a letter.
    func testAsciiSymbolIsNotALetter() {
        let c: Character = "!"

        XCTAssertFalse(c.isALetter, "ASCII symbol Character is not reporting if it is a letter correctly")
    }

    /// Test if an Emoji `Character` is correctly reported as not a letter.
    func testEmojiIsNotALetter() {
        let c: Character = "🤓"

        XCTAssertFalse(c.isALetter, "Emoji Character is not reporting if it is a letter correctly")
    }

    /// Test if a `Character` that is an uppercase letter is correctly reported as uppercase.
    func testUppercaseLetterIsUppercase() {
        let c: Character = "S"

        XCTAssertTrue(c.isUppercase, "Uppercase Character is not reporting uppercase correctly")
    }

    /// Test if a `Character` with a number is correctly reported as uppercase.
    func testNumberIsNotUppercase() {
        let c: Character = "1"

        XCTAssertTrue(c.isUppercase, "Number Character is not reporting uppercase correctly")
    }

    /// Test if a `Character` with an ASCII symbol is correctly reported as uppercase.
    func testAsciiSymbolIsNotUppercase() {
        let c: Character = "!"

        XCTAssertTrue(c.isUppercase, "ASCII symbol Character is not reporting uppercase correctly")
    }

    /// Test if a `Character` with an Emoji is correctly reported as uppercase.
    func testEmojiIsNotUppercase() {
        let c: Character = "🤓"

        XCTAssertTrue(c.isUppercase, "Emoji Character is not reporting uppercase correctly")
    }
}
