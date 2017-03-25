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
    /// - Author: Bobby Jap
    ///
    /// - Returns: A random key.
    static func generateKey() -> String

    /// Validates a key.
    ///
    /// - Parameter key: The key to validate.
    ///
    /// - Author: Bobby Jap
    ///
    /// - Returns: Whether or not the key is valid for encryption.
    static func validate(key: String) -> Bool
}
