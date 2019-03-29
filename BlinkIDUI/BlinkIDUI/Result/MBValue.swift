//
//  MBValue.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 3/27/19.
//  Copyright © 2019 Microblink. All rights reserved.
//

import MicroBlink

/// Enum that defines the type of MBValue class
@objc public enum MBValueType: UInt {
    case string
    case date
    case bool
}

/// Protocol representing result value
@objc public protocol MBValue: NSObjectProtocol {
    /// Property that describes what type of value
    /// is represented.
    @objc var type: MBValueType { get }
}

/// Value that contains the date representation
@objc public class MBDateValue: NSObject, MBValue {
    @objc public var type: MBValueType { return .date }
    
    /// Day property
    @objc public let day: Int
    /// Month property
    @objc public let month: Int
    /// Year property
    @objc public let year: Int
    
    /// Date property, it is optional if the date wasn't able to be constructed.
    /// This can happen if one of the components is 0
    /// For example if the date field of a document is written as month/year, so that no day is provided
    @objc public let date: Date?
    
    init(value: MBDateResult) {
        day = value.day
        month = value.month
        year = value.year
        
        date = value.date
    }
    
    override public var description: String {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ddyyyyMM", options: 0, locale: Locale.current)
            formatter.locale = Locale.current
            
            return formatter.string(from: date)
        }
        
        // Usually means that the date is incomplete, the document has
        // just year or year and month for the date.
        
        var dateString = "\(year)"
        
        if month > 0 {
            dateString = "\(month)/\(dateString)"
        }
        
        return dateString
    }
}

/// Value that contains the string field representation
@objc public class MBStringValue: NSObject, MBValue {
    @objc public var type: MBValueType { return .date }
    
    /// String value representing the value of a field
    @objc public let value: String
    
    init(value: String) {
        self.value = value
    }
    
    override public var description: String {
        return value
    }
    
}

/// Value that contains the boolean field representation
@objc public class MBBoolValue: NSObject, MBValue {
    @objc public var type: MBValueType { return .bool }

    /// Bool value representing the value of a field
    @objc public let value: Bool
    
    init(value: Bool) {
        self.value = value
    }
    
    override public var description: String {
        return value ? "true" : "false"
    }
}
