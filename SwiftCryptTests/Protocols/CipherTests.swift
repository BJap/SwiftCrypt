//
//  CipherTests.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/4/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

@testable import SwiftCrypt
import XCTest

class CipherTests: XCTestCase {
    // MARK: CIPHER TESTS

    /// Test default implementation of the prepare function.
    func testPrepare() {
        let text = "TEST"
        let prepared = CipherProtocol.prepare(text: text)

        XCTAssertEqual(prepared, text, "Text and preprared text should be equal by default")
    }
}

private class CipherProtocol: Cipher {
    /// Stubbed out encryption function for testable class.
    static func encrypt(text: String, withKey key: String) throws -> String {
        return text
    }

    /// Stubbed out decryption function for testable class.
    static func decrypt(cipher: String, withKey key: String) throws -> String {
        return cipher
    }
}
