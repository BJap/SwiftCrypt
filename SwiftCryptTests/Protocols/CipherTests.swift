//
//  CipherTests.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/4/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import XCTest
@testable import SwiftCrypt

class CipherTests: XCTestCase
{
    // MARK: CIPHER TESTS

    /// Test default implementation of the prepare function.
    ///
    /// - Author: Bobby Jap
    func testPrepare()
    {
        let text = "TEST"
        let prepared = CipherTests.prepare(text: text)

        XCTAssertEqual(prepared, text, "Text and preprared text should be equal by default")
    }
}

extension CipherTests: Cipher
{
    /// Stubbed out encryption function for testable class.
    ///
    /// - Author: Bobby Jap
    internal static func encrypt(text: String, withKey key: String) throws -> String
    {
        return ""
    }

    /// Stubbed out decryption function for testable class.
    ///
    /// - Author: Bobby Jap
    internal static func decrypt(cipher: String, withKey key: String) throws -> String
    {
        return ""
    }
}
