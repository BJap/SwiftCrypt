//
//  Character+CryptoTests.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/5/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import XCTest
@testable import SwiftCrypt

class CharacterCryptoTests: XCTestCase
{
    // MARK: CHARACTER CRYPTO TESTS

    /// Test an ASCII `Character` to `Int` conversion
    ///
    /// - Author: Bobby Jap
    func asciiValueTest()
    {
        let c: Character = "A"
        let i = c.asciiValue

        XCTAssertEqual(i, 65, "ASCII value not generating correctly")
    }

    /// Test an non-ASCII `Character` to `Int` conversion
    ///
    /// - Author: Bobby Jap
    func nonAsciiValueTest()
    {
        let c: Character = "\u{1F60A}"

        XCTAssertNil(c.asciiValue, "ASCII value should not have generated")
    }
}
