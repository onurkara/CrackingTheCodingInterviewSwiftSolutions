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

