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

    /// Rotates all the ASCII characters in the input the appropriate direction and count.
    ///
    /// - Parameter input: The text to be rotated.
    ///
    /// - Parameter key: The key with which to rotate the input.
    ///
    /// - Parameter rotator: The rotator rules that specify how to rotate each character.
    ///
    /// - Returns: The rotated input.
    static func rotate(input: String, withKey key: String, usingRotator rotator: Rotator) -> String
    {
        if !validate(key: key)
        {
            fatalError("The given key is invalid and must be a number from 1 to 25")
        }

        var characters:[Character] = Array(input.characters)
        var i = 0;
        let k = Int(key)!

        for character in input.characters
        {
            var c = character
            var av = character.asciiValue ?? 0

            if ("A" as Character) <= c && c <= ("Z" as Character)
            {
                av = rotator.rotate(av, k)
                
                if rotator.bigBoundExceeded(av)
                {
                    av = rotator.wrap(av)
                }
                
                c = av.charValue!
            }
            else if ("a" as Character) <= c && c <= ("z" as Character)
            {
                av = rotator.rotate(av, k)
                
                if rotator.smallBoundExceeded(av)
                {
                    av = rotator.wrap(av)
                }
                
                c = av.charValue!
            }

            characters[i] = c
            
            i += 1
        }

        return String(characters)
    }
}

extension Caesar: Cipher
{
    public static func encrypt(text: String, withKey key: String) -> String
    {
        let rotator = Rotator(rotate: { $0 + $1 },
                              wrap: { $0 - 26 },
                              bigBoundExceeded: { $0 > ("Z" as Character).asciiValue! },
                              smallBoundExceeded: { $0 > ("z" as Character).asciiValue! })

        return rotate(input: text, withKey: key, usingRotator: rotator)
    }

    public static func decrypt(cipher: String, withKey key: String) -> String
    {
        let rotator = Rotator(rotate: { $0 - $1 },
                              wrap: { $0 + 26 },
                              bigBoundExceeded: { $0 < ("A" as Character).asciiValue! },
                              smallBoundExceeded: { $0 < ("a" as Character).asciiValue! })

        return rotate(input: cipher, withKey: key, usingRotator: rotator)
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
