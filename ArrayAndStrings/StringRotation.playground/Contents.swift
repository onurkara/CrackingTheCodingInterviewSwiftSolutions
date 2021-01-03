import XCTest

func isStringRotationOfOtherString(mainString: String, otherString: String) -> Bool {
    return mainString.sorted() == otherString.sorted()
}

final class TestStringIsRotationOfOtherString: XCTestCase {

    func testIsStringRotationOfOtherStringSucceded() {
        XCTAssertTrue(isStringRotationOfOtherString(mainString: "waterbottle", otherString: "erbottlewat"))
    }

    func testStringRotationOfOtherStringSuccedeSecond() {
        XCTAssertFalse(isStringRotationOfOtherString(mainString: "watterbottle", otherString: "erbottlewat"))
    }
}

TestStringIsRotationOfOtherString.defaultTestSuite.run()


