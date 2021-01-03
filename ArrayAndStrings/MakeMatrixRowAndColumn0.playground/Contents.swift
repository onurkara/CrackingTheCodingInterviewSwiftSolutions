import XCTest

// Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.

func makeColumnAndRowsZero(matrix: [[Int]]) -> [[Int]] {

    var updatedMatrix = matrix
    var zeroRows: [Bool] = Array(repeating: false, count: matrix.count)
    var zeroColumns: [Bool] =  Array(repeating: false, count: matrix.first!.count)

    for i in 0...updatedMatrix.count - 1 {
        for j in 0...updatedMatrix[i].count - 1 {
            if updatedMatrix[i][j] == 0 {
                zeroRows[i] = true
                zeroColumns[j] = true
            }
        }
    }

    for i in 0...updatedMatrix.count - 1 {
        for j in 0...updatedMatrix[i].count - 1 {
            if zeroRows[i] == true {
                updatedMatrix[i][j] = 0
            }

            if zeroColumns[j] == true {
                updatedMatrix[i][j] = 0
            }
        }
    }

    return updatedMatrix
}


final class MakeColumnAndRowsZeroTests: XCTestCase {

    func testMakeColumnAndRowsZeroSucceded() {
        XCTAssertEqual(makeColumnAndRowsZero(matrix: [[1,2,3], [4,0,6], [7,8,9], [10,11,12]]),
                                            [[1,0,3], [0,0,0], [7,0,9], [10,0,12]])
    }

    func testMakeColumnAndRowsZeroSuccededSecond() {
        XCTAssertEqual(makeColumnAndRowsZero(matrix: [[1,0,3], [4,5,0]]),
                                            [[0,0,0], [0,0,0]])
    }
}

MakeColumnAndRowsZeroTests.defaultTestSuite.run()
