//
//  Cipher.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 11/14/16.
//  Copyright © 2016 Bobby Jap. All rights reserved.
//

import Foundation

protocol Cipher {
    /// Encrypts the text.
    ///
    /// - Parameters:
    ///   - text: The text to be encrypted.
    ///   - key: The key with which to encrypt the text.
    /// - Throws: `InputError.InvalidKey` when an invalid key is used.
    /// - Returns: The encrypted ciphertext.
    static func encrypt(text: String, withKey key: String) throws -> String

    /// Decrypts the text.
    ///
    /// - Parameters:
    ///   - cipher: The text to be decrypted.
    ///   - key: The key with which to decrypt the text.
    /// - Throws: `InputError.InvalidKey` when an invalid key is used.
    /// - Returns: The decrypted text.
    static func decrypt(cipher: String, withKey key: String) throws -> String

    /// Prepares the text to be encrypted.
    /// For example: Some ciphers do not encrypt specific characters
    /// or character cases and the text needs pre-treated.
    ///
    /// - Note: This function is optional and, if unimplemented, returns the same text
    /// - Parameter text: The text to be prepared.
    /// - Returns: The prepared text.
    static func prepare(text: String) -> String
}

extension Cipher {
    /// Default implementation for text preparation
    ///
    /// - Parameter text: The text to be prepared.
    /// - Returns: The same text that was input.
    public static func prepare(text: String) -> String {
        return text
    }
}
