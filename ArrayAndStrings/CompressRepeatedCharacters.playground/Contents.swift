import XCTest


//  Implement a method to perform basic string compression using the counts of repeated characters

func compressStringRepeatedCharacters(value: String) -> String {

    var tempValue = value
    var result = ""
    var repeatedCounter = 1

    while tempValue.count > 0 {
        let firstValue =  tempValue.first
        tempValue = String(tempValue.dropFirst())
        if firstValue == tempValue.first {
            repeatedCounter += 1
        } else {
            result += String(firstValue!) + "\(repeatedCounter)"
            repeatedCounter = 1
        }
    }

    return result
}


final class CompressStringRepeatedCharacterTests: XCTestCase {

    func testCompressStringRepeatedSucceded() {
        XCTAssertEqual(compressStringRepeatedCharacters(value: "aabcccccaaa"), "a2b1c5a3")
    }

    func testCompressStringRepeatedSuccededSecond() {
        XCTAssertEqual(compressStringRepeatedCharacters(value: "abcdefgh"), "a1b1c1d1e1f1g1h1")
    }

    func testCompressStringRepeatedSuccededThird() {
        XCTAssertEqual(compressStringRepeatedCharacters(value: "aaaaaaar"), "a7r1")
    }

    func testCompressStringRepeatedSuccededFourth() {
        XCTAssertEqual(compressStringRepeatedCharacters(value: "aallrrmmeeppaaqqttx"), "a2l2r2m2e2p2a2q2t2x1")
    }
}


CompressStringRepeatedCharacterTests.defaultTestSuite.run()
