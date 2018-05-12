//
//  Character+Crypto.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/27/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

extension Character {
    /// Generates the ASCII `Int` value of the `Character` in decimal.
    var decimalValue: Int? {
        let av = String(self).unicodeScalars.filter { $0.isASCII }.first?.value

        return av != nil ? Int(av!) : nil
    }

    /// Whether or not the `Character` is an ASCII letter.
    var isAsciiLetter: Bool {
        return isUppercaseAsciiLetter || isLowercaseAsciiLetter
    }

    /// Whether or not the `Character` is an uppercase ASCII letter.
    var isUppercaseAsciiLetter: Bool {
        return ("A" as Character) <= self && self <= ("Z" as Character)
    }

    /// Whether or not the `Character` is a lowercase ASCII letter.
    var isLowercaseAsciiLetter: Bool {
        return ("a" as Character) <= self && self <= ("z" as Character)
    }
}
