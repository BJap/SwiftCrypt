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

    let asciiLetterError = "Character is not reporting if it is a letter correctly"
    let uppercaseAsciiLetterError = "Character is not reporting uppercase ASCII letter correctly"
    let lowercaseAsciiLetterError = "Character is not reporting lowercase ASCII letter correctly"

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

    /// Test if an ASCII letter `Character` is correctly reported as an ASCII letter.
    func testAsciiLetterIsAsciiLetter() {
        let c: Character = "A"

        XCTAssertTrue(c.isAsciiLetter, "Letter \(asciiLetterError)")
    }

    /// Test if a number `Character` is correctly reported as not an ASCII letter.
    func testNumberIsNotALetter() {
        let c: Character = "1"

        XCTAssertFalse(c.isAsciiLetter, "Number \(asciiLetterError)")
    }

    /// Test if an ASCII symbol `Character` is correctly reported as not an ASCII letter.
    func testAsciiSymbolIsNotALetter() {
        let c: Character = "!"

        XCTAssertFalse(c.isAsciiLetter, "ASCII symbol \(asciiLetterError)")
    }

    /// Test if an Emoji `Character` is correctly reported as not an ASCII letter.
    func testEmojiIsNotALetter() {
        let c: Character = "🤓"

        XCTAssertFalse(c.isAsciiLetter, "Emoji \(asciiLetterError)")
    }

    /// Test if a `Character` that is an uppercase letter is correctly reported as an uppercase ASCII letter.
    func testUppercaseAsciiLetterIsUppercaseAsciiLetter() {
        let c: Character = "S"

        XCTAssertTrue(c.isUppercaseAsciiLetter, "Uppercase ASCII letter \(uppercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is a number is correctly reported as not an uppercase ASCII letter.
    func testNumberIsNotUppercaseAsciiLetter() {
        let c: Character = "1"

        XCTAssertFalse(c.isUppercaseAsciiLetter, "Number \(uppercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is an ASCII symbol is correctly reported as not an uppercase ASCII letter.
    func testAsciiSymbolIsNotUppercaseAsciiLetter() {
        let c: Character = "!"

        XCTAssertFalse(c.isUppercaseAsciiLetter, "ASCII symbol \(uppercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is an Emoji is correctly reported as not uppercase ASCII letter.
    func testEmojiIsNotUppercaseAsciiLetter() {
        let c: Character = "🤓"

        XCTAssertFalse(c.isUppercaseAsciiLetter, "Emoji \(uppercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is an lowercase letter is correctly reported as not an uppercase ASCII letter.
    func testLowercaseAsciiLetterIsNotUppercaseAsciiLetter() {
        let c: Character = "s"

        XCTAssertFalse(c.isUppercaseAsciiLetter, "Lowercase ASCII letter \(uppercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is a lowercase ASCII letter is correctly reported as a lowercase ASCII letter.
    func testLowercaseLetterIsLowercase() {
        let c: Character = "s"

        XCTAssertTrue(c.isLowercaseAsciiLetter, "Uppercase ASCII letter \(lowercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is a number is correctly reported as not a lowercase ASCII letter.
    func testNumberIsLowercase() {
        let c: Character = "1"

        XCTAssertFalse(c.isLowercaseAsciiLetter, "Number \(lowercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is an ASCII symbol is correctly reported as not a lowercase ASCII letter.
    func testAsciiSymbolIsLowercase() {
        let c: Character = "!"

        XCTAssertFalse(c.isLowercaseAsciiLetter, "ASCII symbol \(lowercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is an Emoji is correctly reported as lowercase not a ASCII letter.
    func testEmojiIsLowercase() {
        let c: Character = "🤓"

        XCTAssertFalse(c.isLowercaseAsciiLetter, "Emoji \(lowercaseAsciiLetterError)")
    }

    /// Test if a `Character` that is an uppercase ASCII letter is correctly reported as not a lowercase ASCII letter.
    func testUppercaseLetterIsNotLowercase() {
        let c: Character = "S"

        XCTAssertFalse(c.isLowercaseAsciiLetter, "Uppercase ASCII letter \(lowercaseAsciiLetterError)")
    }
}
