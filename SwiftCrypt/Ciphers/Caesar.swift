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
    struct Rotator
    {
        let rotate: (Int, Int) -> Int
        let wrap: (Int) -> Int
        let bigBoundExceeded: (Int) -> Bool
        let smallBoundExceeded: (Int) -> Bool
    }

    static let invalidCaesarKey = "The given key is invalid and must be a number from 1 to 25"

    /// Rotates all the ASCII characters in the input the appropriate direction and count.
    ///
    /// - Parameter input: The text to be rotated.
    ///
    /// - Parameter key: The key with which to rotate the input.
    ///
    /// - Parameter rotator: The rotator rules that specify how to rotate each character.
    ///
    /// - Returns: The rotated input.
    static func rotate(input: String, withKey key: String, usingRotator rotator: Rotator) -> String?
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
                av = rotator.rotate(av, k)

                if ("A" as Character) <= c && c <= ("Z" as Character)
                {
                    if rotator.bigBoundExceeded(av) { av = rotator.wrap(av) }

                    characters[i] = av.charValue!
                }
                else if ("a" as Character) <= c && c <= ("z" as Character)
                {
                    if rotator.smallBoundExceeded(av) { av = rotator.wrap(av) }

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
    public static func encrypt(text: String, withKey key: String) throws -> String
    {
        let rotator = Rotator(rotate: { $0 + $1 },
                              wrap: { $0 - 26 },
                              bigBoundExceeded: { $0 > ("Z" as Character).asciiValue! },
                              smallBoundExceeded: { $0 > ("z" as Character).asciiValue! })

        guard let cipher = rotate(input: text, withKey: key, usingRotator: rotator) else
        {
            throw InputError.InvalidKey(message: invalidCaesarKey)
        }

        return cipher
    }

    public static func decrypt(cipher: String, withKey key: String) throws -> String
    {
        let rotator = Rotator(rotate: { $0 - $1 },
                              wrap: { $0 + 26 },
                              bigBoundExceeded: { $0 < ("A" as Character).asciiValue! },
                              smallBoundExceeded: { $0 < ("a" as Character).asciiValue! })

        guard let text = rotate(input: cipher, withKey: key, usingRotator: rotator) else
        {
            throw InputError.InvalidKey(message: invalidCaesarKey)
        }

        return text
    }
}

extension Caesar: Key
{
    public static func generateKey() -> String
    {
        return String(arc4random_uniform(24) + 1)
    }

    public static func validate(key: String) -> Bool
    {
        let k = Int(key) ?? -1
        
        return 0 < k && k < 26
    }
}

extension Character
{
    /// Generates the ASCII Int value of the Character
    var asciiValue: Int?
    {
        let av = String(self).unicodeScalars.filter{$0.isASCII}.first?.value
        
        return av != nil ? Int(av!) : nil
    }
}

extension Int
{
    /// Generates the Character value of an Int
    var charValue: Character?
    {
        let s = UnicodeScalar(self)
        
        return s != nil ? Character(s!) : nil
    }
}
