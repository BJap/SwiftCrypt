//
//  Int+CryptoTest.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/5/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import XCTest
@testable import SwiftCrypt

class Int_CryptoTest: XCTestCase
{
    // MARK: CHARACTER_CRYPTO TESTS

    /// Test an `Int` in the ASCII range to `Character` conversion
    ///
    /// - Author: Bobby Jap
    func charValueTest()
    {
        let i = 65;
        let c = i.charValue

        XCTAssertEqual(c, "A", "Character value not generating correctly")
    }

    /// Test an `Int` outside the ASCII range to `Character` conversion
    ///
    /// - Author: Bobby Jap
    func nonAsciiValueTest()
    {
        let i = 128

        XCTAssertNil(i.charValue, "Character value should not have generated")
    }
}