//
//  Int+Crypto.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/1/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

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
