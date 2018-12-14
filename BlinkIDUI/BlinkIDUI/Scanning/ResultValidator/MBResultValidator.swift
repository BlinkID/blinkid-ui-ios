//
//  MBResultValidator.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 19/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBResultValidator {
    var isResultValid = true

    private var _matchingKeys: [(MBFieldKey, MBFieldKey)]
    private let _charactersToSkip: [Character]?

    convenience init() {
        self.init(withMatchingKeys: [(MBFieldKey, MBFieldKey)]())
    }

    init(withMatchingKeys matchingKeys: [(MBFieldKey, MBFieldKey)], charactersToSkip: [Character]? = nil) {
        _matchingKeys = matchingKeys
        _charactersToSkip = charactersToSkip
    }

    func match(results: [MBFieldResult]) {
        isResultValid = true

        if let combinedRecognizer = results.first as? MBCombinedRecognizer {
            isResultValid = combinedRecognizer.combinedResult.documentDataMatch
            return
        }

        guard results.count != 1 else {
            isResultValid = true
            return
        }

        if let frontResults = results.first?.extractFieldResults() as? [MBField],
            let backResults = results.last?.extractFieldResults() as? [MBField] {
            for (key1, key2) in _matchingKeys {
                if let value1 = frontResults.first(where: { $0.key == key1 }),
                    let value2 = backResults.first(where: { $0.key == key2 }) {
                    if _calcDistance(value1.value, value2.value) > 1 {
                        isResultValid = false
                        return
                    }
                }
            }
        }

    }

    func addMatchingKeys(_ key1: MBFieldKey, _ key2: MBFieldKey) {
        _matchingKeys.append((key1, key2))
    }

    // MARK: - Distance -

    private func _calcDistance(_ originalString: String, _ decoratedString: String) -> Int {
        // this method uses dynamic programming approach, similar to calculating
        // the Levenshtein distance between two strings with different costs for addition/removal,
        // substitution and replacement

        var a = Array("*\(originalString.lowercased())")
        var b = Array("*\(decoratedString.lowercased())")

        if let charactersToSkip = _charactersToSkip {
            a = a.filter({ !charactersToSkip.contains($0) })
            b = b.filter({ !charactersToSkip.contains($0) })
        }

        let aLength = a.count - 1
        let bLength = b.count - 1

        var distance = Array(repeating: Array(repeating: 0, count: bLength + 1), count: aLength + 1)

        for i in 1...aLength {
            distance[i][0] = i
        }

        for j in 1...bLength {
            distance[0][j] = j
        }

        for i in 1...aLength {
            for j in 1...bLength {
                if a[i - 1] == b[j - 1] {
                    distance[i][j] = distance[i - 1][j - 1]
                } else {
                    distance[i][j] = min(
                        distance[i - 1][j] + 1,
                        distance[i][j - 1] + 1,
                        distance[i - 1][j - 1] + _calcSubstitutionCost(originalChar: a[i], decoratedChar: b[j])
                    )
                }
            }
        }

        return distance[aLength][bLength]
    }

    private func _calcSubstitutionCost(originalChar: Character, decoratedChar: Character) -> Int {
        if originalChar == decoratedChar {
            return 0
        }

        return 1
    }
}
