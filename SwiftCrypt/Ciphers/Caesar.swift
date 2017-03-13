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
    struct Shifter
    {
        let shift: (Int, Int) -> Int
        let wrap: (Int) -> Int
        let bigBoundExceeded: (Int) -> Bool
        let smallBoundExceeded: (Int) -> Bool
    }
    
    /// Shifts all the characters in the input the appropriate direction and count.
    ///
    /// - Parameter input: The text to be shifted.
    ///
    /// - Parameter key: The key with which to shift the input.
    ///
    /// - Parameter shift: The function that specifies how to shift each character.
    ///
    /// - Returns: The shift input.
    static func shift(input: String, withKey key: String, withShifter shifter: Shifter) -> String
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
            
            if av >= ("A" as Character).asciiValue! && av <= ("Z" as Character).asciiValue!
            {
                av = shifter.shift(av, k)
                
                if shifter.bigBoundExceeded(av)
                {
                    av = shifter.wrap(av)
                }
                
                c = av.charValue!
            }
            else if av >= ("a" as Character).asciiValue! && av <= ("z" as Character).asciiValue!
            {
                av = shifter.shift(av, k)
                
                if shifter.smallBoundExceeded(av)
                {
                    av = shifter.wrap(av)
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
        let shifter = Shifter(shift: { $0 + $1 },
                              wrap: { $0 - 26 },
                              bigBoundExceeded: { $0 > ("Z" as Character).asciiValue! },
                              smallBoundExceeded: { $0 > ("z" as Character).asciiValue! })
        
        return shift(input: text, withKey: key, withShifter: shifter)
    }
    
    public static func decrypt(cipher: String, withKey key: String) -> String
    {
        let shifter = Shifter(shift: { $0 - $1 },
                              wrap: { $0 + 26 },
                              bigBoundExceeded: { $0 < ("A" as Character).asciiValue! },
                              smallBoundExceeded: { $0 < ("a" as Character).asciiValue! })
        
        return shift(input: cipher, withKey: key, withShifter: shifter)
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
        
        return k > 0 && k < 26
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
