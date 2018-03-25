//
//  GeneralErrors.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/20/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

/// An error to use when an invalid func parameter is used
///
/// - Author: Bobby Jap
enum InputError: Error {
    case invalidKey(message: String)
}
