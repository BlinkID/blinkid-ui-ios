//
//  MBCombinedValidator.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 3/29/19.
//  Copyright © 2019 Microblink. All rights reserved.
//

import MicroBlink

class MBCombinedValidator: MBValidatorProtocol {
    
    func match(results: [MBFieldResult]) -> Bool {
        guard let combinedRecognizer = results.first as? MBCombinedRecognizer else {
            // TODO: think about this
            return true
        }
        
        return combinedRecognizer.combinedResult.documentDataMatch
    }
    
}
