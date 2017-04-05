//
//  CipherTest.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/4/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import XCTest
@testable import SwiftCrypt

class CipherTest: XCTestCase
{
    // MARK: CIPHER TESTS

    /// Test default implementation of the prepare function.
    ///
    /// - Author: Bobby Jap
    func testPrepare()
    {
        let text = "TEST"
        let prepared = CipherTest.prepare(text: text)

        XCTAssertEqual(text, prepared, "Text and preprared text should be equal by default")
    }
}

extension CipherTest: Cipher
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
