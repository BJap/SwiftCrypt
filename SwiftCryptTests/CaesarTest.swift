//
//  CaesarTest.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/12/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import XCTest
@testable import SwiftCrypt

class CaesarTest: XCTestCase
{
    // MARK: ENCRYPTION TESTS
    
    /// Tests successful encryption.
    func testEncrypt()
    {
        let text = "TEST textz!"
        let key = "5"
        let cipher = Caesar.encrypt(text: text, withKey: key)
        
        XCTAssertEqual("YJXY yjcye!", cipher)
    }
    
    // MARK: DECRYPTION TESTS
    
    /// Tests successful decryption.
    func testDecrypt()
    {
        let cipher = "YJXY yjcye!"
        let key = "5"
        let text = Caesar.decrypt(cipher: cipher, withKey: key)
        
        XCTAssertEqual("TEST textz!", text)
    }
    
    // MARK: RANDOM KEY TESTS
    
    /// Test successful key generation.
    func testRandomKey()
    {
        let key = Caesar.generateKey()
        
        XCTAssertTrue(Int(key)! > 0)
        XCTAssertTrue(Int(key)! < 26)
    }
    
    // MARK: VALIDATE KEY TESTS
    
    /// Test successful key validation.
    func testKeyValidation()
    {
        XCTAssertTrue(Caesar.validate(key: "5"))
        XCTAssertFalse(Caesar.validate(key: "-1"))
        XCTAssertFalse(Caesar.validate(key: "0"))
        XCTAssertFalse(Caesar.validate(key: "26"))
        XCTAssertFalse(Caesar.validate(key: "40"))
        XCTAssertFalse(Caesar.validate(key: ""))
    }
}
