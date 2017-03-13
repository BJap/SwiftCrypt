//
//  Caesar.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/12/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

class Caesar: Cipher, Key
{
    // MARK: CIPHER PROTOCOL
    
    static func encrypt(text: String, withKey key: String) -> String
    {
        return "A"
    }
    
    static func decrypt(cipher text: String, withKey key: String) -> String
    {
        return "A"
    }
    
    // MARK: KEY PROTOCOL
    
    static func randomKey() -> String
    {
        return "47"
    }
    
    static func randomKey(withSeed seed: UInt32) -> String
    {
        return "47"
    }
    
    static func validate(key: String) -> Bool
    {
        return false
    }
}
