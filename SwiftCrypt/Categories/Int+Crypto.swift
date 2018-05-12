//
//  Int+Crypto.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 4/1/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

extension Int {
    /// Generates an ASCII letter from the `Int`.
    var asciiValue: Character? {
        guard let s = UnicodeScalar(self) else {
            return nil
        }

        let c = Character(s)

        if c.isAsciiLetter {
            return c
        }

        return nil
    }
}
