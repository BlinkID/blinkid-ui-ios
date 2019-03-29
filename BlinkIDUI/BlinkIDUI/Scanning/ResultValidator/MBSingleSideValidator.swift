//
//  MBSingleSideValidator.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 3/29/19.
//  Copyright © 2019 Microblink. All rights reserved.
//

import Foundation

class MBSingleSideValidatorBuilder {

    private var _matchingPairs: [MBMatchingPair] = [MBMatchingPair]()

    @discardableResult
    func addMatchingPair(frontSideKey: MBFieldKey, backSideKey: MBFieldKey, maxDistanceBetweenStrings: Int = 1, charactersToSkip: [Character]? = nil) -> MBSingleSideValidatorBuilder {
        _matchingPairs.append(MBMatchingPair(frontSideKey: frontSideKey,
                                             backSideKey: backSideKey,
                                             maxDistanceBetweenStrings: maxDistanceBetweenStrings,
                                             charactersToSkip: charactersToSkip))
        return self
    }

    @discardableResult
    func addMatchingPair(matchingPair: MBMatchingPair) -> MBSingleSideValidatorBuilder {
        _matchingPairs.append(matchingPair)
        return self
    }

    func build() -> MBSingleSideValidator {
        return MBSingleSideValidator(matchingPairs: _matchingPairs)
    }

}

class MBSingleSideValidator: MBValidatorProtocol {

    private let _matchingPairs: [MBMatchingPair]

    init(matchingPairs: [MBMatchingPair]) {
        _matchingPairs = matchingPairs
    }

    func match(results: [MBFieldResult]) -> Bool {
        guard results.count != 1,
            let frontResults = results.first?.extractFieldResults() as? [MBField],
            let backResults = results.last?.extractFieldResults() as? [MBField] else {
                // TODO: think about this
                return true
        }

        for pair in _matchingPairs {
            let frontSideKey = pair.frontSideKey
            let backSideKey = pair.backSideKey
            let distance = pair.maxDistanceBetweenStrings
            let charactersToSkip = pair.charactersToSkip

            if let value1 = frontResults.first(where: { $0.key == frontSideKey })?.value,
                let value2 = backResults.first(where: { $0.key == backSideKey })?.value {
                if _calcDistance(value1.description, value2.description, charactersToSkip: charactersToSkip) > distance {
                    return false
                }
            }
        }

        return true
    }

    private func _calcDistance(_ originalString: String, _ decoratedString: String, charactersToSkip: [Character]?) -> Int {
        // this method uses dynamic programming approach, similar to calculating
        // the Levenshtein distance between two strings with different costs for addition/removal,
        // substitution and replacement
        var a = Array("*\(originalString.lowercased())")
        var b = Array("*\(decoratedString.lowercased())")

        if let charactersToSkip = charactersToSkip {
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

    // TODO: Add possible substitutions based on the document
    private func _calcSubstitutionCost(originalChar: Character, decoratedChar: Character) -> Int {
        if originalChar == decoratedChar {
            return 0
        }

        return 1
    }

}
