//
//  Caesar.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/12/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

class Caesar
{
    /// A set of rules to determine how to shift each Latin `Character` in a `String`
    ///
    /// - Author: Bobby Jap
    struct Shifter
    {
        let shift: (Int, Int) -> Int
        let wrap: (Int) -> Int
        let bigBoundExceeded: (Int) -> Bool
        let smallBoundExceeded: (Int) -> Bool
    }

    static let invalidCaesarKey = "The given key is invalid and must be a number from 1 to 25"

    /// Shifts all the ASCII characters in the input the appropriate direction and count.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Complexity: O(n)
    ///
    /// ---
    /// Example:
    ///
    ///     shift("Hello World", withKey: "5", usingShifter: shifter)
    /// ---
    ///
    /// - Parameter input: The text to be shifted.
    ///
    /// - Parameter key: The key with which to shift the input.
    ///
    /// - Parameter shifter: The shifter rules that specify how to shift each character.
    ///
    /// - Returns: The shifted input.
    static func shift(input: String, withKey key: String, usingShifter shifter: Shifter) -> String?
    {
        if !validate(key: key)
        {
            return nil
        }

        var characters:[Character] = Array(input.characters)
        let k = Int(key)!
        var i = 0;

        for c in input.characters
        {
            if var av = c.asciiValue
            {
                av = shifter.shift(av, k)

                if ("A" as Character) <= c && c <= ("Z" as Character)
                {
                    if shifter.bigBoundExceeded(av) { av = shifter.wrap(av) }

                    characters[i] = av.charValue!
                }
                else if ("a" as Character) <= c && c <= ("z" as Character)
                {
                    if shifter.smallBoundExceeded(av) { av = shifter.wrap(av) }

                    characters[i] = av.charValue!
                }
            }
            else { characters[i] = c }
            
            i += 1
        }

        return String(characters)
    }
}

extension Caesar: Cipher
{
    /// Encrypts the text using the Caesar shift cipher.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Complexity: O(n)
    ///
    /// ---
    /// Example:
    ///
    ///     encrypt("Hello World", withKey: "5")
    /// ---
    ///
    /// - Parameter text: The text to be encrypted.
    ///
    /// - Parameter key: The key with which to encrypt the text.
    ///
    /// - Throws: `InputError.InvalidKey` when an invalid key is used.
    ///
    /// - Returns: The encrypted ciphertext.
    public static func encrypt(text: String, withKey key: String) throws -> String
    {
        let shifter = Shifter(shift: { $0 + $1 },
                              wrap: { $0 - 26 },
                              bigBoundExceeded: { $0 > ("Z" as Character).asciiValue! },
                              smallBoundExceeded: { $0 > ("z" as Character).asciiValue! })

        guard let cipher = shift(input: text, withKey: key, usingShifter: shifter) else
        {
            throw InputError.InvalidKey(message: invalidCaesarKey)
        }

        return cipher
    }

    /// Decrypts the text.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Complexity: O(n)
    ///
    /// ---
    /// Example:
    ///
    ///     decrypt("Mjqqt Btwqi", withKey: "5")
    /// ---
    ///
    /// - Parameter cipher: The text to be decrypted.
    ///
    /// - Parameter key: The key with which to decrypt the text.
    ///
    /// - Throws: `InputError.InvalidKey` when an invalid key is used.
    ///
    /// - Returns: The decrypted text.
    public static func decrypt(cipher: String, withKey key: String) throws -> String
    {
        let shifter = Shifter(shift: { $0 - $1 },
                              wrap: { $0 + 26 },
                              bigBoundExceeded: { $0 < ("A" as Character).asciiValue! },
                              smallBoundExceeded: { $0 < ("a" as Character).asciiValue! })

        guard let text = shift(input: cipher, withKey: key, usingShifter: shifter) else
        {
            throw InputError.InvalidKey(message: invalidCaesarKey)
        }

        return text
    }
}

extension Caesar: Key
{
    /// Generates a random key as a number from 1 to 25.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Returns: A random key.
    public static func generateKey() -> String
    {
        return String(arc4random_uniform(24) + 1)
    }

    /// Validates a key.
    ///
    /// - Parameter key: The key to validate.
    ///
    /// - Author: Bobby Jap
    ///
    /// ---
    /// Example:
    ///
    ///     validate("5")
    /// ---
    ///
    /// - Returns: Whether or not the key is valid for encryption.
    public static func validate(key: String) -> Bool
    {
        let k = Int(key) ?? -1
        
        return 0 < k && k < 26
    }
}

extension Character
{
    /// Generates the ASCII Int value of the Character
    ///
    /// - Author: Bobby Jap
    var asciiValue: Int?
    {
        let av = String(self).unicodeScalars.filter{$0.isASCII}.first?.value
        
        return av != nil ? Int(av!) : nil
    }
}

extension Int
{
    /// Generates the Character value of an Int
    ///
    /// - Author: Bobby Jap
    var charValue: Character?
    {
        let s = UnicodeScalar(self)
        
        return s != nil ? Character(s!) : nil
    }
}
