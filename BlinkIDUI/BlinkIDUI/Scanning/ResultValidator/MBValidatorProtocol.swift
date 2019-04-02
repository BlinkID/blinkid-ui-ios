//
//  MBValidatorProtocol.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 3/29/19.
//  Copyright © 2019 Microblink. All rights reserved.
//

protocol MBValidatorProtocol {
    
    func match(results: [MBFieldResult]) -> Bool
    
}
