//
//  Key.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 11/14/16.
//  Copyright © 2016 Bobby Jap. All rights reserved.
//

import Foundation

protocol Key
{    
    /// Generates a random key.
    ///
    /// - Parameter clearText: The text to be prepared.
    ///
    /// - Returns: A random key.
    static func randomKey() -> String
    
    /// Generates a random key.
    ///
    /// - Parameter seed: The seed with which to generate random values.
    ///
    /// - Returns: A random key.
    static func randomKey(seed: UInt32) -> String
    
    /// Validates a key.
    ///
    /// - Parameter key: The key to validate.
    ///
    /// - Returns: Whether or not the key is valid for encryption.
    static func validate(key: String) -> Bool
}
