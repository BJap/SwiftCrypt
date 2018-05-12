//
//  Shifter.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 5/12/18.
//  Copyright © 2018 Bobby Jap. All rights reserved.
//

import Foundation

/// A set of rules to determine how to shift each Latin `Character` in a `String`.
struct Shifter {
    let shift: (Int, Int) -> Int
    let wrap: (Int, Int) -> Int
    let uppercaseBoundExceeded: (Int) -> Bool
    let lowercaseBoundExceeded: (Int) -> Bool

    /// Shifts the `Character` if it is ASCII the appropriate count.
    ///
    /// - Parameters:
    ///   - input: The `Character` to be shifted.
    ///   - distance: The distance to shift the `Character` input.
    /// - Returns: The shifted `Character`.
    func shift(input: Character, distance: Int) -> Character {
        guard input.isAsciiLetter else {
            return input
        }

        var av = shift(input.decimalValue!, distance)

        if (input.isUppercaseAsciiLetter && uppercaseBoundExceeded(av)) ||
            (input.isLowercaseAsciiLetter && lowercaseBoundExceeded(av)) {
            av = wrap(av, 26)
        }

        return av.asciiValue!
    }

    /// Shifts every `Character` that is ASCII in the input `String` the appropriate direction and count.
    ///
    /// - Complexity: O(n) where n = input length
    /// ---
    /// Example:
    ///
    ///     shift("Hello World", withKey: "5", usingShifter: shifter)
    /// ---
    /// - Parameters:
    ///   - input: The `String` to be shifted.
    ///   - distance: The distance to shift each `Character` in the `String` input.
    /// - Returns: The shifted input.
    func shift(input: String, distance: Int) -> String {
        var output = ""

        for c in input {
            let shiftedLetter = shift(input: c, distance: distance)

            output += String(shiftedLetter)
        }

        return output
    }
}
