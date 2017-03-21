//
//  GeneralErrors.swift
//  SwiftCrypt
//
//  Created by Bobby Jap on 3/20/17.
//  Copyright © 2017 Bobby Jap. All rights reserved.
//

import Foundation

enum InputError: Error
{
    case InvalidKey(message: String)
}
