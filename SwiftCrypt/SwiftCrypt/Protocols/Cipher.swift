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
    /// - Parameter clearText: The text to be encrypted.
    ///
    /// - Parameter key: The key with which to encrypt the text.
    ///
    /// - Returns: The encrypted ciphertext.
    static func encrypt(clearText: String, key: String) -> String
    
    /// Decrypts the text.
    ///
    /// - Parameter cipherText: The text to be decrypted.
    ///
    /// - Parameter key: The key with which to decrypt the text.
    ///
    /// - Returns: The decrypted text.
    static func decrypt(cipherText: String, key: String) -> String
    
    /// Prepares the text to be encrypted.
    /// For example: Some ciphers do not encrypt specific characters
    /// or character cases and the text needs pre-treated.
    ///
    /// - Parameter clearText: The text to be prepared.
    ///
    /// - Returns: The prepared text.
    @objc optional static func prepare(clearText: String) -> String
}
