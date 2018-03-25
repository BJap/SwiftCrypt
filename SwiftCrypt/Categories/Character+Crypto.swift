//
//  Character+Crypto.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/27/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

extension Character {
    /// Generates the ASCII `Int` value of the `Character`.
    var asciiValue: Int? {
        let av = String(self).unicodeScalars.filter { $0.isASCII }.first?.value

        return av != nil ? Int(av!) : nil
    }

    /// Whether or not the `Character` is a letter.
    var isALetter: Bool {
        return (("A" as Character) <= self && self <= ("Z" as Character)) ||
            (("a" as Character) <= self && self <= ("z" as Character))
    }

    /// Whether or not the `Character` is a letter is uppercase.
    var isUppercase: Bool {
        if ("a" as Character) <= self && self <= ("z" as Character) {
            return false
        } else {
            return true
        }
    }
}
