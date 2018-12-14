//
//  MBRecognizerResultsProtocols.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 29/09/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

extension MBDateResult {
    var stringDate: String {
        if let date = self.date?.customFormatValue() {
            return date
        }

        if let date = originalDateString {
            return date
        }

        return "\(day)-\(month)-\(year)"
    }
}

extension Date {
    func stringDate(withRawDate rawDate: String? = nil) -> String? {
        if let date = customFormatValue() {
            return date
        }

        return rawDate
    }
}

extension DateFormatter {
    convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }
}

extension Date {
    struct CustomFormatter {
        static let custom = DateFormatter(dateStyle: .short, timeStyle: .none)
    }

    func customFormatValue() -> String? {
        return CustomFormatter.custom.string(from: self)
    }
}

@objc extension NSString {
    struct CustomFormatter {
        static let custom = DateFormatter(dateStyle: .short, timeStyle: .none)
    }

    dynamic func dateFromStringValue() -> Date? {
        return CustomFormatter.custom.date(from: (self as String))
    }
}
