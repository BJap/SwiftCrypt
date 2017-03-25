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
    /// - Author: Bobby Jap
    ///
    /// - Parameter text: The text to be encrypted.
    ///
    /// - Parameter key: The key with which to encrypt the text.
    ///
    /// - Throws: `InputError.InvalidKey` when an invalid key is used.
    ///
    /// - Returns: The encrypted ciphertext.
    static func encrypt(text: String, withKey key: String) throws -> String

    /// Decrypts the text.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Parameter cipher: The text to be decrypted.
    ///
    /// - Parameter key: The key with which to decrypt the text.
    ///
    /// - Throws: `InputError.InvalidKey` when an invalid key is used.
    ///
    /// - Returns: The decrypted text.
    static func decrypt(cipher: String, withKey key: String) throws -> String

    /// Prepares the text to be encrypted.
    /// For example: Some ciphers do not encrypt specific characters
    /// or character cases and the text needs pre-treated.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Parameter text: The text to be prepared.
    ///
    /// - Returns: The prepared text.
    @objc optional static func prepare(text: String) -> String
}
