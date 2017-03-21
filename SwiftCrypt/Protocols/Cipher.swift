//
//  Cipher.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 11/14/16.
//  Copyright © 2016 Bobby Jap. All rights reserved.
//

import Foundation

@objc protocol Cipher
{    
    /// Encrypts the text.
    ///
    /// - Parameter text: The text to be encrypted.
    ///
    /// - Parameter key: The key with which to encrypt the text.
    ///
    /// - Returns: The encrypted ciphertext.
    static func encrypt(text: String, withKey key: String) throws -> String

    /// Decrypts the text.
    ///
    /// - Parameter cipher: The text to be decrypted.
    ///
    /// - Parameter key: The key with which to decrypt the text.
    ///
    /// - Returns: The decrypted text.
    static func decrypt(cipher: String, withKey key: String) throws -> String

    /// Prepares the text to be encrypted.
    /// For example: Some ciphers do not encrypt specific characters
    /// or character cases and the text needs pre-treated.
    ///
    /// - Parameter text: The text to be prepared.
    ///
    /// - Returns: The prepared text.
    @objc optional static func prepare(text: String) -> String
}
