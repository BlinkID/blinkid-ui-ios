//
//  MBResultValidator.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 19/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

struct MBMatchingPair {
    let frontSideKey: MBFieldKey
    let backSideKey: MBFieldKey
    let maxDistanceBetweenStrings: Int
    let charactersToSkip: [Character]?
}
