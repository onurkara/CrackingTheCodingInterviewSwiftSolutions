import XCTest
import Foundation

// Write a method to replace all spaces in a string with'%20'. You may assume that the string has sufficient space at the end of the string to hold the additional characters, and that you are given the "true" length of the string.

func replaceSpaceWithString(value: String) -> String {

    let replacedValue = "%20"
    var updatedValue = ""

    for item in value {
        if item == " " {
            updatedValue += replacedValue
        } else {
            updatedValue += String(item)
        }

        if updatedValue.count == value.count {
            break
        }
    }

    return updatedValue
}

final class ReplaceSpaceWithStringTests: XCTestCase {

    func testReplacingSucceded() {
        XCTAssertEqual(replaceSpaceWithString(value: "aa a  "), "aa%20a")
    }

    func testReplacingSuccededSecond() {
        XCTAssertEqual(replaceSpaceWithString(value: "a a a    "), "a%20a%20a")
    }

    func testReplacingSuccededThird() {
        XCTAssertEqual(replaceSpaceWithString(value: "a  a a      "), "a%20%20a%20a")
    }

    func testReplacingSuccededFourth() {
        XCTAssertEqual(replaceSpaceWithString(value: "a  a   a    a a                    "), "a%20%20a%20%20%20a%20%20%20%20a%20a")
    }

    func testReplacingFailed() {
        XCTAssertFalse(replaceSpaceWithString(value: "a a ") == "a%20a")
    }
}

ReplaceSpaceWithStringTests.defaultTestSuite.run()
