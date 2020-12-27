import XCTest


// Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

func determineStringHasAllUniqueCharacters(value: String) -> Bool {

    let valueSet = Set(value)
    return value.count == valueSet.count
}

func determineStringHasAllUniqueCharacterWithoutDataStructures(value: String) -> Bool {

    var tempValue = value
    for _ in tempValue {
        let tempString = tempValue.removeFirst()
        if tempValue.contains(tempString) {
            return false
        }
    }

    return true
}

final class UniqueCharacterStringTest: XCTestCase {

    func testDetermineStringHasAllUniqueCharactersSucceded() {
        XCTAssertTrue(determineStringHasAllUniqueCharacters(value: "aString"))
    }

    func testDetermineStringHasAllUniqueCharactersFailed() {
        XCTAssertFalse(determineStringHasAllUniqueCharacters(value: "aStringa"))
    }

    func testDetermineStringHasAllUniqueCharactersFailedWithMidChar() {
        XCTAssertFalse(determineStringHasAllUniqueCharacters(value: "aStriang"))
    }

    func testDetermineStringHasAllUniqueCharactersWithoutDataStructureSucceded() {
        XCTAssertTrue(determineStringHasAllUniqueCharacterWithoutDataStructures(value: "aString"))
    }

    func testDetermineStringHasAllUniqueCharactersWithoutDataStructureFailed() {
        XCTAssertFalse(determineStringHasAllUniqueCharacterWithoutDataStructures(value: "aStringa"))
    }

    func testDetermineStringHasAllUniqueCharactersFailedWithoutDataStructureWithMidChar() {
        XCTAssertFalse(determineStringHasAllUniqueCharacterWithoutDataStructures(value: "aStriang"))
    }
}

UniqueCharacterStringTest.defaultTestSuite.run()


// Given two strings, write a method to decide if one is a permutation of the other.

func decideStringsArePermutated(firstValue: String, secondValue: String) -> Bool {

    if firstValue.count != secondValue.count {
        return false
    }

    var firstValueDictionary: [Character: Int] = [:]
    var secondValueDictionary: [Character: Int] = [:]

    firstValue.forEach { item in
        if firstValueDictionary[item] != nil {
            firstValueDictionary[item]! += 1
        } else {
            firstValueDictionary[item] = 1
        }
    }

    secondValue.forEach { item in
        if secondValueDictionary[item] != nil {
            secondValueDictionary[item]! += 1
        } else {
            secondValueDictionary[item] = 1
        }
    }

    return firstValueDictionary == secondValueDictionary
}

func decideStringsArePermutatedSortedSolution(firstValue: String, secondValue: String) -> Bool {
    return firstValue.sorted() == secondValue.sorted()
}

final class PermutatedStringTests: XCTestCase {

    func testDeterminePermutatedStringsSucceded() {
        XCTAssertTrue(decideStringsArePermutated(firstValue: "first", secondValue: "strfi"))
    }

    func testDeterminePermutatedStringsSuccededSecond() {
        XCTAssertTrue(decideStringsArePermutated(firstValue: "irstfiii", secondValue: "risitifi"))
    }

    func testDeterminePermutatedStringsSuccededThird() {
        XCTAssertTrue(decideStringsArePermutated(firstValue: "irsrtfiiis", secondValue: "rrissitifi"))
    }

    func testDetermimnePermutatedStringFailed() {
        XCTAssertFalse(decideStringsArePermutated(firstValue: "first", secondValue: "strf"))
    }

    func testDetermimnePermutatedStringFailedSecond() {
        XCTAssertFalse(decideStringsArePermutated(firstValue: "firstiad", secondValue: "strdaf"))
    }

    func testDeterminePermutatedStringsSuccededSortedSolution() {
        XCTAssertTrue(decideStringsArePermutatedSortedSolution(firstValue: "first", secondValue: "strfi"))
    }

    func testDeterminePermutatedStringsSuccededSecondSortedSolution() {
        XCTAssertTrue(decideStringsArePermutatedSortedSolution(firstValue: "irstfiii", secondValue: "risitifi"))
    }

    func testDeterminePermutatedStringsSuccededThirdSortedSolution() {
        XCTAssertTrue(decideStringsArePermutatedSortedSolution(firstValue: "irsrtfiiis", secondValue: "rrissitifi"))
    }

    func testDetermimnePermutatedStringFailedSortedSolution() {
        XCTAssertFalse(decideStringsArePermutatedSortedSolution(firstValue: "first", secondValue: "strf"))
    }

    func testDetermimnePermutatedStringFailedSecondSortedSolution() {
        XCTAssertFalse(decideStringsArePermutatedSortedSolution(firstValue: "firstiad", secondValue: "strdaf"))
    }
}


PermutatedStringTests.defaultTestSuite.run()
