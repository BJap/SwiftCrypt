//
//  Caesar.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/12/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

/// The Ceasar Cipher.
struct Caesar {
    private static let leftShifter: Shifter = Shifter(shift: -,
                                      wrap: +,
                                      uppercaseBoundExceeded: { $0 < ("A" as Character).decimalValue! },
                                      lowercaseBoundExceeded: { $0 < ("a" as Character).decimalValue! })

    private static let rightShifter: Shifter = Shifter(shift: +,
                                       wrap: -,
                                       uppercaseBoundExceeded: { $0 > ("Z" as Character).decimalValue! },
                                       lowercaseBoundExceeded: { $0 > ("z" as Character).decimalValue! })

    private static let invalidCaesarKey = "The given key is invalid and must be a number from 1 to 25"
}

extension Caesar: Cipher {
    /// Encrypts the text using the Caesar shift cipher.
    ///
    /// - Complexity: O(n) where n = input length
    /// ---
    /// Example:
    ///
    ///     encrypt("Hello World", withKey: "5")
    /// ---
    /// - Parameters:
    ///   - text: The text to be encrypted.
    ///   - key: The key with which to encrypt the text.
    /// - Throws: `InputError.invalidKey` when an invalid key is used.
    /// - Returns: The encrypted ciphertext.
    public static func encrypt(text: String, withKey key: String) throws -> String {
        guard validate(key: key) else {
            throw InputError.invalidKey(message: invalidCaesarKey)
        }

        let d = Int(key)!

        return rightShifter.shift(input: text, distance: d)
    }

    /// Decrypts the text.
    ///
    /// - Complexity: O(n) where n = input length
    /// ---
    /// Example:
    ///
    ///     decrypt("Mjqqt Btwqi", withKey: "5")
    /// ---
    /// - Parameters:
    ///   - cipher: The text to be decrypted.
    ///   - key: The key with which to decrypt the text.
    /// - Throws: `InputError.invalidKey` when an invalid key is used.
    /// - Returns: The decrypted text.
    public static func decrypt(cipher: String, withKey key: String) throws -> String {
        guard validate(key: key) else {
            throw InputError.invalidKey(message: invalidCaesarKey)
        }

        let d = Int(key)!

        return leftShifter.shift(input: cipher, distance: d)
    }
}

extension Caesar: Key {
    /// Generates a random key as a number from 1 to 25.
    ///
    /// - Returns: A random key.
    public static func generateKey() -> String {
        return String(arc4random_uniform(24) + 1)
    }

    /// Validates a key.
    ///
    /// - Parameter key: The key to validate.
    /// ---
    /// Example:
    ///
    ///     validate("5")
    /// ---
    /// - Returns: Whether or not the key is valid for encryption.
    public static func validate(key: String) -> Bool {
        let k = Int(key) ?? -1

        return 0 < k && k < 26
    }
}
