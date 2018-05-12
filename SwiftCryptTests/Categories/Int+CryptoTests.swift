//
//  Int+CryptoTests.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/5/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

@testable import SwiftCrypt
import XCTest

class IntCryptoTests: XCTestCase {
    // MARK: INT CRYPTO TESTS

    /// Test an `Int` in the ASCII range to `Character` conversion.
    func testCharValue() {
        let i = 65
        let c = i.asciiValue

        XCTAssertEqual(c, "A", "Letter value not generating correctly")
    }

    /// Test an `Int` outside the ASCII range to `Character` conversion.
    func testNonAsciiValue() {
        let i = 128

        XCTAssertNil(i.asciiValue, "Letter value should not have generated")
    }

    /// Test an `Int` outside the `UnicodeScaler` range to `Character` conversion.
    func testNonUnicodeScalerValue() {
        let i = 2000000

        XCTAssertNil(i.asciiValue, "Letter value should not have generated")
    }
}
