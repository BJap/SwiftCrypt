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
    static func shift(input: String, withKey key: String, withShifter shift: (Character, Int) -> (Character)) -> String
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
            characters[i] = shift(character, k)
            
            i += 1
        }
        
        return String(characters)
    }
}

extension Caesar: Cipher
{
    public static func encrypt(text: String, withKey key: String) -> String
    {
        func encryptCharacter(character: Character, withKey key: Int) -> Character
        {
            var c = character
            var av = character.asciiValue ?? 0
            
            if av >= ("A" as Character).asciiValue! && av <= ("Z" as Character).asciiValue!
            {
                av += key
                
                if av > ("Z" as Character).asciiValue!
                {
                    av -= 26
                }
                
                c = av.charValue!
            }
            else if av >= ("a" as Character).asciiValue! && av <= ("z" as Character).asciiValue!
            {
                av += key
                
                if av > ("z" as Character).asciiValue!
                {
                    av -= 26
                }
                
                c = av.charValue!
            }
            
            return c
        }
        
        let e = encryptCharacter
        
        return shift(input: text, withKey: key, withShifter: e)
    }
    
    public static func decrypt(cipher: String, withKey key: String) -> String
    {
        func decryptCharacter(character: Character, withKey key: Int) -> Character
        {
            var c = character
            var av = character.asciiValue ?? 0
            
            if av >= ("A" as Character).asciiValue! && av <= ("Z" as Character).asciiValue!
            {
                av -= key
                
                if av < ("A" as Character).asciiValue!
                {
                    av += 26
                }
                
                c = av.charValue!
            }
            else if av >= ("a" as Character).asciiValue! && av <= ("z" as Character).asciiValue!
            {
                av -= key
                
                if av < ("a" as Character).asciiValue!
                {
                    av += 26
                }
                
                c = av.charValue!
            }
            
            return c
        }
        
        let d = decryptCharacter
        
        return shift(input: cipher, withKey: key, withShifter: d)
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
