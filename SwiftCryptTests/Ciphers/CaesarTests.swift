//
//  CaesarTests.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/12/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

@testable import SwiftCrypt
import XCTest

class CaesarTests: XCTestCase {
    // MARK: ENCRYPTION TESTS

    /// Test successful encryption.
    ///
    /// - Author: Bobby Jap
    func testEncrypt() {
        let text = "TEST textz!"
        let key = "5"

        do {
            let cipher = try Caesar.encrypt(text: text, withKey: key)

            XCTAssertEqual(cipher, "YJXY yjcye!")
        } catch {
            XCTFail("Exception shouldn't have been thrown")
        }
    }

    /// Test encryption of empty `String`.
    ///
    /// - Author: Bobby Jap
    func testEncryptEmptyString() {
        let text = ""
        let key = "5"

        do {
            let cipher = try Caesar.encrypt(text: text, withKey: key)

            XCTAssertEqual(cipher, "")
        } catch {

            XCTFail("Exception shouldn't have been thrown")
        }
    }

    /// Test encryption failure with invalid key.
    ///
    /// - Author: Bobby Jap
    func testEncryptWithInvalidKey() {
        let text = "TEST textz!"
        let key = "K"

        XCTAssertThrowsError(try Caesar.encrypt(text: text, withKey: key))
    }

    // MARK: DECRYPTION TESTS

    /// Test successful decryption.
    ///
    /// - Author: Bobby Jap
    func testDecrypt() {
        let cipher = "YJXY yjcye!"
        let key = "5"

        do {
            let text = try Caesar.decrypt(cipher: cipher, withKey: key)

            XCTAssertEqual(text, "TEST textz!")
        } catch {
            XCTFail("Exception shouldn't have been thrown")
        }
    }

    /// Test decryption of empty `String`.
    ///
    /// - Author: Bobby Jap
    func testDecryptEmptyString() {
        let cipher = ""
        let key = "5"

        do {
            let text = try Caesar.decrypt(cipher: cipher, withKey: key)

            XCTAssertEqual(text, "")
        } catch {
            XCTFail("Exception shouldn't have been thrown")
        }

    }

    /// Test decryption failure with invalid key.
    ///
    /// - Author: Bobby Jap
    func testDecryptWithInvalidKey() {
        let cipher = "YJXY yjcye!"
        let key = "K"

        XCTAssertThrowsError(try Caesar.decrypt(cipher: cipher, withKey: key))
    }

    // MARK: RANDOM KEY TESTS

    /// Test successful key generation.
    ///
    /// - Author: Bobby Jap
    func testRandomKey() {
        let key = Caesar.generateKey()

        XCTAssertTrue(Int(key)! > 0)
        XCTAssertTrue(Int(key)! < 26)
    }

    // MARK: VALIDATE KEY TESTS

    /// Test successful key validation.
    ///
    /// - Author: Bobby Jap
    func testKeyValidation() {
        XCTAssertTrue(Caesar.validate(key: "5"))
        XCTAssertFalse(Caesar.validate(key: "-1"))
        XCTAssertFalse(Caesar.validate(key: "0"))
        XCTAssertFalse(Caesar.validate(key: "26"))
        XCTAssertFalse(Caesar.validate(key: "40"))
        XCTAssertFalse(Caesar.validate(key: ""))
        XCTAssertFalse(Caesar.validate(key: "HELLO"))
    }
}
