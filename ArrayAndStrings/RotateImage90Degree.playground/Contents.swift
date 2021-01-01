import XCTest

//Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees.

func rotate90DegressGivenImage(image: [[Int]]) -> [[Int]] {

    let imageCount = image.count
    var rotatedImage = Array(repeating: Array(repeating: 0, count: imageCount), count: imageCount)
    var originalImage = image
    originalImage.reverse()
    let originalImageCount = rotatedImage.count

    for i in 0...originalImageCount-1 {
        for j in 0...originalImageCount-1 {
            rotatedImage[i][j] = originalImage[j][i]
        }
    }

    return rotatedImage
}


final class Rotate90DegreesGivenImageTests: XCTestCase {

    func testRotateImageSucceded() {
        XCTAssertEqual(rotate90DegressGivenImage(image: [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]),
                                                [[13,9,5,1], [14,10,6,2], [15,11,7,3], [16,12,8,4]])
    }

    func testRotateImageSuccededSecond() {
        XCTAssertEqual(rotate90DegressGivenImage(image: [[1,2,3],[4,5,6],[7,8,9]]),
                                                [[7,4,1], [8,5,2], [9,6,3]])
    }
}


Rotate90DegreesGivenImageTests.defaultTestSuite.run()
