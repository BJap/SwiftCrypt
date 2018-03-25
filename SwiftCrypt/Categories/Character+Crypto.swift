//
//  Character+Crypto.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/27/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

extension Character {
    /// Generates the ASCII Int value of the Character
    ///
    /// - Author: Bobby Jap
    var asciiValue: Int? {
        let av = String(self).unicodeScalars.filter { $0.isASCII }.first?.value

        return av != nil ? Int(av!) : nil
    }
}
